# research-ralphy

Self-evolving ralph offspring that turns research discoveries into implementation
PRDs for the contrib repos.

Uses ralph as a git submodule. Weekly cycle: discover -> select -> PRD -> TDD.

The operative PRD-generation workflow lives in config/prd-generation-prompt.md:
pre-synthesis via cc-meta skills, discovery from ai-agents-research, selection of
the top 3-5 contrib-relevant findings, then docs/PRD.md plus generate_prd_json.py.

## Conventions

- Agent config is AGENTS.md-only; CLAUDE.md is a symlink to this file.
- Claude Code plugins are configured in .claude/settings.json against the
  qte77-claude-code-plugins marketplace; shared rules live in .claude/rules/.
