# Claude Autodev Team

**Choose your language / Escolha o idioma:** [Português (Brasil)](pt-BR/README.md) · [English](README.md)

A reusable multi-agent development workflow for Claude Code. It combines one orchestrator with nine specialists, a skill-aware workflow, Git worktrees, quality gates, security checks, compact handoffs, and cost-conscious coordination.

> This repository contains configuration and instructions—not a hosted development service. Actual behavior depends on the Claude Code version, installed agents/skills, tools, project configuration, permissions, and human approvals available in each environment.

## What this project is for

Use this starter kit to coordinate software tasks that benefit from defined responsibilities: clarifying requirements, planning architecture, implementing changes, handling data, testing, security review, deployment preparation, independent review, and controlling context/token waste.

It is intentionally conservative: **inspect and reuse before creating; delegate only when useful; verify before claiming success; never deploy without authorization.**

## Team at a glance

| Agent | Main responsibility | Typical trigger |
|---|---|---|
| `orquestrador` | Owns workflow, delegation, gates, integration, and final report | Every substantial task |
| `product-owner` | Converts a request into scope and acceptance criteria | Ambiguous, multi-step, or user-facing work |
| `arquiteto` | Analyzes architecture, contracts, dependencies, and trade-offs | Cross-module changes, new integrations, major refactors |
| `fullstack-developer` | Implements assigned application changes and targeted tests | Code changes |
| `database-specialist` | Handles schema, migrations, data integrity, and query performance | Database or persistence changes |
| `qa-engineer` | Reproduces bugs and runs tests against acceptance criteria | Bug fixes, risky changes, release checks |
| `security-engineer` | Reviews secrets, access control, inputs, dependencies, and deployment risks | Auth/data exposure, dependencies, sensitive or release work |
| `devops-engineer` | Works on CI/CD, deployment readiness, smoke tests, and rollback | Pipeline, environment, release, or hosting changes |
| `reviewer-documentation` | Independently reviews diffs and keeps documentation aligned | Before integration/release, or documentation changes |
| `finops-context` | Reduces redundant work and context/token waste without weakening quality | Large, parallel, repetitive, or long-running tasks |

Detailed responsibilities, inputs/outputs, decision boundaries, and handoffs: **[Agent Guide](docs/AGENT-GUIDE.md)**. The process overview is in [Agent Workflow](docs/agent-workflow.md).

## Repository layout

- `.claude/agents/` — orchestrator and nine specialist definitions.
- `.claude/skills/autodev/SKILL.md` — the `/autodev` workflow.
- `CLAUDE.md` — project-wide working rules.
- `contexto.md` — compact, resumable project-state template.
- `docs/AGENT-GUIDE.md` — detailed team handbook and responsibility boundaries.
- `docs/` — installation, skill catalog, asset reuse, quality gates, cost/context, deployment, and workflow guidance.
- `scripts/` — PowerShell helper for inventorying locally installed skills.
- `pt-BR/` — Portuguese (Brazil) version of the configuration and documentation.

## Quick start (Windows / PowerShell)

```powershell
git clone https://github.com/GCopellis/claude-autodev-team.git
Set-Location .\claude-autodev-team
Get-Content .\docs\INSTALLATION.md
```

1. Read the [installation guide](docs/INSTALLATION.md) and [agent guide](docs/AGENT-GUIDE.md).
2. Inspect the target project's current instructions, tests, assets, deployment configuration, and Git status.
3. Merge the relevant `.claude/` configuration into the target project; **do not blindly overwrite project-specific files**.
4. Confirm that required skills and tools are actually installed. A name in a catalog is not proof of availability.
5. Start on a feature branch with a small, reversible task. Review the diff and run the project's real tests before widening use.

For Portuguese instructions, begin at [pt-BR/README.md](pt-BR/README.md).

## Operating principles

- **Minimal delegation:** the orchestrator chooses the smallest useful set of agents; a small task may need no specialist.
- **Clear ownership:** parallel work is allowed only for independent tasks with defined file ownership and interfaces.
- **Evidence-based status:** report `PASS`, `FAIL`, or `BLOCKED`; do not claim unrun tests, reviews, or deployments.
- **Git safety:** preserve user changes; avoid destructive resets, force-pushes, secret commits, and unresolved integration conflicts.
- **Asset reuse:** find existing components, scripts, styles, tests, documentation, and official brand assets before creating replacements.
- **Security first:** never expose credentials or private data; production work requires configured gates and applicable human approval.
- **Context discipline:** maintain a concise `contexto.md`; store long evidence in reports and link to it.
- **Cost honesty:** optimize avoidable work, but never invent token savings or skip required quality checks.

## Quality gates and release boundaries

The [quality-gates guide](docs/QUALITY-GATES.md) describes the baseline checks. At minimum, do not mark a task complete until acceptance criteria are addressed, relevant tests have actually run (or are explicitly blocked), the diff has been reviewed, and risks/limitations are reported. Database migrations, security findings, and production authorization require special attention. Preparing a deployment is not the same as deploying it.

## Important limitations

- The agents are instruction files; they are not guarantees that a model, tool, plugin, skill, or subagent is available in every installation.
- The orchestrator must discover installed skills and read their instructions before using them.
- The repository does not include a project's application code, credentials, hosting account, official logo, or deployment secrets.
- Deployment and external actions depend on real environment configuration, permissions, approval, and verification.
- The helper scripts and CI checks validate only what they are configured to check; they do not replace application tests or a security audit.

## Documentation map

- [Detailed agent guide](docs/AGENT-GUIDE.md)
- [Installation](docs/INSTALLATION.md)
- [Skills catalog](docs/SKILLS-CATALOG.md)
- [Asset reuse](docs/ASSETS-AND-REUSE.md)
- [Quality gates](docs/QUALITY-GATES.md)
- [Context and cost control](docs/CONTEXT-AND-COST.md)
- [Deployment](docs/DEPLOYMENT.md)
- [Agent workflow](docs/agent-workflow.md)

## License

MIT. See [LICENSE](LICENSE).
