-include ralph/Makefile

# ralph/Makefile's recipes use paths relative to the TEMPLATE's own root
# (e.g. ralph/scripts/...), which only resolve when make runs from inside
# the submodule. As a git submodule here, the template's scripts actually
# live one level deeper, at ralph/ralph/scripts/.... Override the two
# targets this repo calls so they run with that working directory instead.
ralph_init_loop:  ## Initialize Ralph loop environment (runs inside ralph/)
	$(MAKE) -C ralph ralph_init_loop

ralph_run:  ## Run Ralph loop (runs inside ralph/) - see ralph/Makefile for params
	$(MAKE) -C ralph ralph_run

ralphy_generate_prd:  ## Generate PRD from feed sources
	claude -p "$$(cat config/prd-generation-prompt.md)" --max-turns 15 \
		--max-budget-usd 5 --permission-mode bypassPermissions

ralphy_evolve:  ## Full evolution cycle: generate PRD + run ralph
	$(MAKE) ralphy_generate_prd
	$(MAKE) ralph_init_loop
	$(MAKE) ralph_run
