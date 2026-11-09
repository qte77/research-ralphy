# Changelog

All notable changes to this project are documented in this file.

The format is based on
[Keep a Changelog](https://keepachangelog.com/en/1.1.0/).

## [Unreleased]

### Fixed

- `config/compound.env` paths can be overridden from the environment (`WORKSPACE_ROOT`, `CLAUDE_HOME` and each variable), instead of hard-coded Codespace paths that do not exist on Actions runners; `docs/configuration.md` documents them and the workflow secrets (#21).

### Added

- `CHANGELOG.md` in Keep a Changelog format (#25).

### Changed

- `AGENTS.md` asks for a CHANGELOG entry on non-trivial changes (#25).
- README states the ralph-loop template self-improvement intent and
  current status; intent detail moves to `docs/UserStory.md` (#23).
- README rewritten to the estate doc-structure canon (#22).
