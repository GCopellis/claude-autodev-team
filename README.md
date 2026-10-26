# Claude Autodev Team

Reusable multi-agent development workflow for Claude Code: one orchestrator, nine specialist agents, skill-aware execution, Git worktrees, verification gates, context compaction, and cost-conscious coordination.

> This repository provides configuration and instructions. It does not guarantee that every agent, skill, model, tool, or deployment provider is available in every installation. Verify installed capabilities first.

## Included
- `.claude/agents/`: orchestrator and nine specialist definitions.
- `.claude/skills/autodev/SKILL.md`: the `/autodev` workflow.
- `CLAUDE.md`: project-wide operating rules.
- `docs/`: installation, skills catalog, asset reuse, quality gates, and deployment.
- `contexto.md`: compact resumable project-state template.
- `scripts/`: PowerShell skill inventory helper.

## Quick start (Windows / PowerShell)
```powershell
git clone https://github.com/GCopellis/claude-autodev-team.git
Set-Location .\claude-autodev-team
Get-Content .\docs\INSTALLATION.md
```

Merge the relevant `.claude/` configuration and instructions into your target project; do not overwrite project-specific files blindly. Start on a feature branch and try `/autodev` with a small task.

## Important
- Start with a test branch, not production.
- Never commit `.env`, API keys, private customer data, or local secrets.
- Deployment must follow the target project's configured approvals and gates.
- This starter kit has no product-specific logos. Agents must reuse official assets already in the target project.
- Skills listed in `docs/SKILLS-CATALOG.md` must be discovered and verified on each machine.

## License
MIT. See [LICENSE](LICENSE).
