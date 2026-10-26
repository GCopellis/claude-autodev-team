# Claude Autodev Team

**Language:** [Português (Brasil)](../README.md) · **English**

A reusable multi-agent development workflow for Claude Code. It combines one orchestrator with nine specialists, skill-aware execution, Git worktrees, quality gates, security checks, compact handoffs, and cost-conscious coordination.

> This repository contains configuration and instructions—not a hosted development service. Actual behavior depends on the Claude Code version, installed agents/skills, tools, project configuration, permissions, and human approvals available in each environment.

## Purpose

Use this starter kit to coordinate software tasks that benefit from clear responsibilities: requirements, architecture, implementation, data changes, testing, security review, deployment preparation, independent review, and context/token efficiency.

The operating principle is conservative: **inspect and reuse before creating; delegate only when useful; verify before claiming success; never deploy without authorization.**

## Team at a glance

| Agent | Main responsibility | Typical trigger |
|---|---|---|
| `orquestrador` | Workflow, delegation, quality gates, integration, final report | Every substantial task |
| `product-owner` | Scope, business rules, acceptance criteria | Ambiguous or multi-step requirements |
| `arquiteto` | Architecture, contracts, dependencies, trade-offs | Cross-module changes, integrations, major refactors |
| `fullstack-developer` | Application implementation and targeted tests | Code changes |
| `database-specialist` | Schema, migrations, integrity, query performance | Persistence or database changes |
| `qa-engineer` | Reproduction and evidence-based testing | Bug fixes, risky changes, release checks |
| `security-engineer` | Secrets, access control, inputs, dependencies, release risks | Sensitive or security-relevant changes |
| `devops-engineer` | CI/CD, deployment readiness, smoke tests, rollback | Pipeline, environment, release, hosting |
| `reviewer-documentation` | Independent diff review and accurate documentation | Before integration/release or docs changes |
| `finops-context` | Reduce duplicate work and context/token waste without weakening quality | Large, parallel, repetitive, long-running tasks |

Read the [detailed agent guide](../docs/AGENT-GUIDE.md) for missions, responsibilities, inputs/outputs, boundaries, and handoffs.

## Quick start (Windows / PowerShell)

```powershell
git clone https://github.com/GCopellis/claude-autodev-team.git
Set-Location .\claude-autodev-team
Get-Content .\docs\INSTALLATION.md
```

1. Read the [installation guide](../docs/INSTALLATION.md) and [agent guide](../docs/AGENT-GUIDE.md).
2. Inspect the target project's instructions, tests, assets, deployment setup, and Git status.
3. Merge relevant `.claude/` configuration into the target project; **do not blindly overwrite project-specific files**.
4. Confirm required skills/tools are actually installed; a catalog entry does not prove availability.
5. Start on a feature branch with a small, reversible task. Review the diff and run real tests before expanding use.

## Operating principles

- **Minimal delegation:** use the smallest useful set of agents; simple tasks may need no specialist.
- **Clear ownership:** parallelize only independent tasks with defined file ownership and interfaces.
- **Evidence-based status:** report `PASS`, `FAIL`, or `BLOCKED`; never claim unrun tests, reviews, or deployments.
- **Git safety:** preserve user changes; avoid destructive resets, force-pushes, secret commits, and unresolved conflicts.
- **Reuse first:** find existing components, scripts, styles, tests, docs, and official brand assets before creating replacements.
- **Security first:** never expose credentials or private data; production work requires configured gates and applicable approval.
- **Context discipline:** keep `contexto.md` concise and link longer evidence from reports.
- **Cost honesty:** reduce avoidable work, but never invent token savings or skip required quality checks.

## Quality gates and limitations

A task is complete only when acceptance criteria have been addressed, relevant tests have actually run (or are explicitly blocked), the diff has been reviewed, and risks/limitations are reported. Database migrations, security findings, and production authorization require special care. Preparing a deployment is not the same as deploying it.

Agent files are instructions, not guarantees that every model, skill, tool, or subagent is available. This repository does not include the target application's code, credentials, hosting account, official product logo, or deployment secrets. CI and helper scripts validate only what they are configured to check; they do not replace application tests or a security audit.

## Documentation

- [Detailed agent guide](../docs/AGENT-GUIDE.md)
- [Installation](../docs/INSTALLATION.md)
- [Skills catalog](../docs/SKILLS-CATALOG.md)
- [Asset reuse](../docs/ASSETS-AND-REUSE.md)
- [Quality gates](../docs/QUALITY-GATES.md)
- [Context and cost control](../docs/CONTEXT-AND-COST.md)
- [Deployment](../docs/DEPLOYMENT.md)
- [Agent workflow](../docs/agent-workflow.md)

## License

MIT. See [LICENSE](../LICENSE).
