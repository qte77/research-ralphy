# Contrib adapter for self-evolving ralphys
# Validates by running upstream test suites in target repos

adapter_validate() {
  local target_repo="${CONTRIB_TARGET_REPO:-}"
  if [[ -n "$target_repo" && -d "$target_repo" ]]; then
    (
      cd "$target_repo" || exit 1
      # Probe for the target via `make -p` on a name with no rule: this prints
      # the database (including every real target) and then fails without
      # building anything, so it is safe even if the target repo's own
      # Makefile uses .ONESHELL (where `make -n`/`-q` can run recipes for real).
      local targets
      targets="$(make -p __contrib_adapter_probe__ 2>/dev/null)"
      if grep -qE '^validate:' <<< "$targets"; then
        make validate
      elif grep -qE '^test:' <<< "$targets"; then
        make test
      else
        echo "adapter_validate: $target_repo has neither a 'validate' nor a 'test' make target" >&2
        exit 1
      fi
    )
  fi
}

adapter_test() { adapter_validate "$@"; }
adapter_lint() { return 0; }
adapter_typecheck() { return 0; }
adapter_complexity() { return 0; }
adapter_coverage() { return 0; }
adapter_signatures() { return 0; }
adapter_file_pattern() { echo "*.md"; }
adapter_env_setup() {
  local config_env="$(git rev-parse --show-toplevel)/config/compound.env"
  [[ -f "$config_env" ]] && source "$config_env"
}
adapter_app_docs() { return 0; }
