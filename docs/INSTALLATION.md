# Installation

## Prerequisites
- Compatible Claude Code installation.
- Git and PowerShell on Windows (or compatible shell).
- Access to the target repository and its test/runtime tools.

Claude Code features, agent tools, skill discovery, and permissions vary by version. Verify local support.

## Install into an existing project
1. Clone this repository separately and inspect its files.
2. In the target repo, check `git status` and create a feature branch.
3. Copy relevant `.claude/agents/`, `.claude/skills/autodev/SKILL.md`, and selected docs into the target repo.
4. Merge `CLAUDE.md` with existing project instructions; do not blindly overwrite.
5. Create/update `contexto.md` with real project state.
6. Start Claude Code in the target project and confirm agents and skill are discovered.
7. Test a small task on a feature branch first.

Example:
```powershell
git status --short --branch
git switch -c chore/install-claude-autodev-team
claude
```

Run `/autodev <task>` if supported by installed Claude Code and correctly discovered skill. If it does not appear, verify the skill location and version.

## Skills
The catalog is a starter map, not an installer. Confirm exact names/paths and read skill instructions. Do not modify colleagues' global skills without consent.

## Production
Configure provider, secrets in the provider's secret store, domain, migrations, backups, health checks, and rollback separately. Start with staging. Installing this kit does not authorize an automatic production deploy.
