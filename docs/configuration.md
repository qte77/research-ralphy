# Configuration

## Secrets (weekly workflow)

`.github/workflows/ralphy-weekly.yaml` needs:

| Secret | Used by | Notes |
| --- | --- | --- |
| `ANTHROPIC_API_KEY` | "Generate PRD from feeds" and "Run Ralph Loop" steps | Repository secret; billed per API use |
| `GITHUB_TOKEN` | "Create PR with results" step | Provided by Actions; the workflow grants `contents: write` and `pull-requests: write` |

## Compound-learning variables

`config/compound.env` is sourced by `.scaffolds/contrib.sh` and by the weekly workflow's loop step. Every
value can be overridden from the environment. The defaults point at the qte77 Codespace layout, which does
not exist on a GitHub Actions runner, so set the paths you need in the workflow `env:` or leave them unset.
As of 2026-11-09 neither the ralph loop nor `config/prd-generation-prompt.md` reads these variables, so
missing paths don't fail a run.

| Variable | Default | Meaning |
| --- | --- | --- |
| `WORKSPACE_ROOT` | `/workspaces/qte77` | Root that holds sibling repo checkouts |
| `CLAUDE_HOME` | `$HOME/.claude` | Claude Code user directory |
| `COMPOUND_ENABLED` | `true` | Turns compound learning on |
| `REPO_INDEX` | `$WORKSPACE_ROOT/qte77/registry/index.json` | Repo registry index |
| `COMPOUND_LEARNINGS_PATH` | `$WORKSPACE_ROOT/ai-agents-research/docs/learnings` | Learnings to read |
| `COMPOUND_MEMORY_PATH` | `$WORKSPACE_ROOT/ai-agents-research/triage` | Triage notes to read |
| `COMPOUND_PLANS_PATH` | `$CLAUDE_HOME/plans` | Claude Code session plans |
| `CC_PROJECTS_PATH` | `$CLAUDE_HOME/projects` | Claude Code project transcripts |
| `CC_TASKS_PATH` | `$CLAUDE_HOME/tasks` | Claude Code task files |
| `CC_TEAMS_PATH` | `$CLAUDE_HOME/teams` | Claude Code team files |
| `CC_STATS_PATH` | `$CLAUDE_HOME/stats-cache.json` | Claude Code usage stats cache |
| `COMPOUND_WRITEBACK_ENABLED` | `true` | Write learnings back after runs |
| `COMPOUND_WRITEBACK_INTERVAL` | `3` | Write back every N iterations |
| `COMPOUND_WRITEBACK_TARGET` | `$WORKSPACE_ROOT/ai-agents-research/docs/learnings` | Write-back destination |
