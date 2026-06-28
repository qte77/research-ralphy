# research-ralphy

> Self-evolving ralph offspring that turns research discoveries into implementation PRDs for the contrib repos.

[![License](https://img.shields.io/badge/license-Apache--2.0-58f4c2.svg)](LICENSE)
[![lint-md-links](https://github.com/qte77/research-ralphy/actions/workflows/lint-md-links.yml/badge.svg)](https://github.com/qte77/research-ralphy/actions/workflows/lint-md-links.yml)
[![ralphy-weekly](https://github.com/qte77/research-ralphy/actions/workflows/ralphy-weekly.yaml/badge.svg)](https://github.com/qte77/research-ralphy/actions/workflows/ralphy-weekly.yaml)

## What

- Automated research-to-PRD pipeline closing the gap between discovery and shipped changes
- Scans ai-agents-research for uncovered Claude Code features and community patterns
- Selects the top 3-5 findings most relevant to the contrib repos each cycle
- Generates structured PRDs (docs/PRD.md) from each selected discovery
- Produces machine-readable PRD JSON via generate_prd_json.py for downstream tooling
- TDD stories with acceptance criteria and target files ready for implementation
- Runs as a weekly scheduled workflow on top of the ralph submodule

## How

ralph is included as a git submodule. Each weekly cycle follows the steps:
discover -> select -> PRD -> TDD.

The operative PRD-generation workflow is [config/prd-generation-prompt.md](config/prd-generation-prompt.md):
pre-synthesis via cc-meta skills, discovery from ai-agents-research, selection of
top findings, then docs/PRD.md and generate_prd_json.py output.

See [AGENTS.md](AGENTS.md) for agent conventions and plugin configuration.

## Why

Research findings rarely convert into shipped changes. Discoveries pile up in
triage folders and digests without ever reaching implementation. This repo closes
that loop by running a weekly agent cycle that converts the best findings into
concrete, TDD-ready PRDs targeted at the active contrib repos.

## References

- [AGENTS.md](AGENTS.md)
- [config/prd-generation-prompt.md](config/prd-generation-prompt.md)
- [ralph upstream — qte77/ralph-loop-cc-tdd-wt-vibe-kanban-template](https://github.com/qte77/ralph-loop-cc-tdd-wt-vibe-kanban-template)
- [An Open Agentic Coding Harness](https://qte77.github.io/open-agentic-coding-harness/)
- [ai-agents-research](https://github.com/qte77/ai-agents-research)

## License

Apache-2.0 - see [LICENSE](LICENSE).
