# Changelog

All notable changes to this project are documented in this file.

The format is based on
[Keep a Changelog](https://keepachangelog.com/en/1.1.0/).

## [Unreleased]

### Security

- `actions/checkout` in `ralphy-weekly.yaml` pinned to a full commit SHA (`@v7` → `3d3c42e5aac5ba805825da76410c181273ba90b1`), matching the repository's Actions policy requiring full-length SHA pins.

### Fixed

- `config/compound.env` paths can be overridden from the environment (`WORKSPACE_ROOT`, `CLAUDE_HOME` and each variable), instead of hard-coded Codespace paths that do not exist on Actions runners; `docs/configuration.md` documents them and the workflow secrets (#21).
- `ralph_run` and `ralph_init_loop` now run inside the `ralph/` submodule (`make -C ralph`), since the included `ralph/Makefile`'s recipes use paths relative to the template's own root, and that root is one level deeper here (`ralph/ralph/scripts/...`) than at the superrepo root; same fix in `config/prd-generation-prompt.md`, which now points `generate_prd_json.py` at the double-nested script with `../docs/PRD.md` so it reads this repo's PRD, not the submodule's own (#24).
- `.scaffolds/contrib.sh`'s `adapter_validate` no longer ends in `|| true`: it now fails when the target repo's `make validate`/`make test` fails, and errors clearly when neither target exists, instead of silently passing. Added `.scaffolds/contrib.test.sh` (RED-GREEN, no CI wiring yet). The template's own `make validate` always exiting 0 ([template#90](https://github.com/qte77/ralph-loop-cc-tdd-wt-vibe-kanban-template/issues/90)) is a separate upstream issue, not fixed here (#24).
- `config/prd-generation-prompt.md`'s Selection step named a vague "contrib repos" target instead of the ralph-loop template, which `docs/UserStory.md` and [template#32](https://github.com/qte77/ralph-loop-cc-tdd-wt-vibe-kanban-template/issues/32) name as the only target (#24).

### Added

- `CHANGELOG.md` in Keep a Changelog format (#25).
- `.github/dependabot.yml` `github-actions` entry (weekly), grouping security updates together and version updates (minor/patch only; majors stay ungrouped for individual review).

### Changed

- `AGENTS.md` asks for a CHANGELOG entry on non-trivial changes (#25).
- README states the ralph-loop template self-improvement intent and
  current status; intent detail moves to `docs/UserStory.md` (#23).
- README rewritten to the estate doc-structure canon (#22).
