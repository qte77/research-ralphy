#!/usr/bin/env bash
# Tests for .scaffolds/contrib.sh's adapter_validate().
#
# It must propagate a failing `make validate`/`make test` run in
# CONTRIB_TARGET_REPO, prefer `validate` over `test` when both exist, and
# fail clearly when the target repo has neither (issue #22 blocker 4: the
# adapter used to end in `|| true`, so a failing check always passed).
#
# Run: bash .scaffolds/contrib.test.sh
set -uo pipefail

repo_root="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
# shellcheck source=contrib.sh
source "$repo_root/.scaffolds/contrib.sh"

tmp="$(mktemp -d)"
trap 'rm -rf "$tmp"' EXIT

failures=0

# GNU make itself reports a failed recipe as exit 2, not the recipe's own
# exit code, so assertions on a `make`-mediated failure check "non-zero",
# not an exact code. The "neither target" case is our own explicit `exit 1`
# (no make invocation involved there), so that one checks the exact code.
assert_nonzero() {
  local desc="$1" actual="$2"
  if [[ "$actual" == "0" ]]; then
    echo "FAIL: $desc (expected non-zero exit, got 0)" >&2
    failures=1
  else
    echo "PASS: $desc"
  fi
}

assert_exit() {
  local desc="$1" expected="$2" actual="$3"
  if [[ "$expected" != "$actual" ]]; then
    echo "FAIL: $desc (expected exit $expected, got $actual)" >&2
    failures=1
  else
    echo "PASS: $desc"
  fi
}

# Case 1: a failing `validate` target must fail the adapter.
mkdir -p "$tmp/failing_validate"
cat > "$tmp/failing_validate/Makefile" <<'MK'
validate:
	exit 1
MK
CONTRIB_TARGET_REPO="$tmp/failing_validate" adapter_validate
assert_nonzero "failing validate propagates" "$?"

# Case 2: a passing `validate` target must pass.
mkdir -p "$tmp/passing_validate"
cat > "$tmp/passing_validate/Makefile" <<'MK'
validate:
	exit 0
MK
CONTRIB_TARGET_REPO="$tmp/passing_validate" adapter_validate
assert_exit "passing validate passes" 0 "$?"

# Case 3: no `validate` target falls back to `test`, and its failure propagates.
mkdir -p "$tmp/test_only"
cat > "$tmp/test_only/Makefile" <<'MK'
test:
	exit 1
MK
CONTRIB_TARGET_REPO="$tmp/test_only" adapter_validate
assert_nonzero "falls back to failing test" "$?"

# Case 4: neither target exists -> clear error, non-zero exit (not a silent pass).
mkdir -p "$tmp/no_targets"
cat > "$tmp/no_targets/Makefile" <<'MK'
help:
	echo hi
MK
CONTRIB_TARGET_REPO="$tmp/no_targets" adapter_validate
assert_exit "neither target errors" 1 "$?"

# Case 5: both targets exist -> `validate` is preferred, `test` is never reached
# (if it ran and its failure were ignored, this would wrongly report success).
mkdir -p "$tmp/both_targets"
cat > "$tmp/both_targets/Makefile" <<'MK'
validate:
	exit 0
test:
	exit 1
MK
CONTRIB_TARGET_REPO="$tmp/both_targets" adapter_validate
assert_exit "prefers validate over test when both exist" 0 "$?"

exit "$failures"
