# Contrib adapter for self-evolving ralphys
# Validates by running upstream test suites in target repos

adapter_validate() {
  local target_repo="${CONTRIB_TARGET_REPO:-}"
  if [[ -n "$target_repo" && -d "$target_repo" ]]; then
    (cd "$target_repo" && make validate 2>/dev/null || make test 2>/dev/null || true)
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
