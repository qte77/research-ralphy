# research-ralphy

> Self-improvement offspring of the [ralph-loop template](https://github.com/qte77/ralph-loop-cc-tdd-wt-vibe-kanban-template): turns external research into tested improvements for the template.

[![License](https://img.shields.io/badge/license-Apache--2.0-58f4c2.svg)](LICENSE)
[![lint-md-links](https://github.com/qte77/research-ralphy/actions/workflows/lint-md-links.yml/badge.svg)](https://github.com/qte77/research-ralphy/actions/workflows/lint-md-links.yml)
[![ralphy-weekly](https://github.com/qte77/research-ralphy/actions/workflows/ralphy-weekly.yaml/badge.svg)](https://github.com/qte77/research-ralphy/actions/workflows/ralphy-weekly.yaml)

## Status

**Not yet working end to end.** Every scheduled weekly run has failed, and GitHub has disabled the workflow for
inactivity (last run 2026-09-02). The fixes are tracked in this repo's
[issues](https://github.com/qte77/research-ralphy/issues).

## What

- **Purpose:** compound *what's new*. Papers, best practices, blog posts, new Claude Code features and community
  patterns become improvements to the ralph-loop template.
- **Feeds:** the curated research in [ai-agents-research](https://github.com/qte77/ai-agents-research):
  - `triage/` (uncovered Claude Code features)
  - `docs/learnings/cross-repo-digest.md`
  - `registry/index.json`

  This repo doesn't search the web itself. External sources are collected and triaged upstream in
  ai-agents-research.
- **Target:** the ralph-loop template.
- **Cycle:**
  1. discover
  2. select the top 3-5 findings ([config/prd-generation-prompt.md](config/prd-generation-prompt.md))
  3. PRD
  4. ralph TDD loop
  5. pull request in this repo
- **Feedback path:** this repo never pushes to the template. Worthwhile changes are picked back into the
  template by the owner. The design is in
  [template#32](https://github.com/qte77/ralph-loop-cc-tdd-wt-vibe-kanban-template/issues/32).
- **Sibling:** [learnings-ralphy](https://github.com/qte77/learnings-ralphy) does the same for *how we work*
  (learnings from our own repos).

## How

- **Weekly cycle:** `.github/workflows/ralphy-weekly.yaml`, Wednesday 12:00 UTC plus manual dispatch (currently
  disabled, see Status).
- **Locally:** `make ralphy_evolve`, which runs PRD generation, then `ralph_init_loop`, then `ralph_run`.
- **The template is included as the `ralph` git submodule.** How improvements get from here back into the
  template (a submodule or a template copy) is still open in
  [template#32](https://github.com/qte77/ralph-loop-cc-tdd-wt-vibe-kanban-template/issues/32).
- See [AGENTS.md](AGENTS.md) for agent conventions and plugin configuration.

## Why

Research findings rarely turn into shipped changes. Discoveries pile up in triage folders and digests without
reaching the tooling we build with. This repo closes that loop for the ralph-loop template: the best new findings
become tested changes to the template, so every project started from it benefits.

## References

- [AGENTS.md](AGENTS.md)
- [config/prd-generation-prompt.md](config/prd-generation-prompt.md)
- [ralph-loop template](https://github.com/qte77/ralph-loop-cc-tdd-wt-vibe-kanban-template) and its
  [self-improvement design (#32)](https://github.com/qte77/ralph-loop-cc-tdd-wt-vibe-kanban-template/issues/32)
- [learnings-ralphy](https://github.com/qte77/learnings-ralphy)
- [An Open Agentic Coding Harness](https://qte77.github.io/open-agentic-coding-harness/)
- [ai-agents-research](https://github.com/qte77/ai-agents-research)

## License

Apache-2.0 - see [LICENSE](LICENSE).
