# Claude Autodev Team — project rules

## First actions
1. Read `contexto.md` if present.
2. Inspect `git status --short --branch`; preserve user changes.
3. Read applicable project instructions and inspect existing code, assets, tests, and deployment configuration.
4. Discover installed skills and tools before invoking them.
5. Form a small plan with acceptance criteria before editing.

## Reuse first
Search for existing functionality, components, styles, assets, logos, tests, scripts, and documentation before creating substitutes. Reuse official project logos exactly; never redraw or replace them without explicit authorization. Record reusable assets in `docs/assets-inventory.md`.

## Skills
Read each selected skill's actual instructions before use. Names in the catalog are not proof that a skill exists. Use only skills relevant to the current task; record unavailable skills and alternatives without pretending they ran. See `docs/SKILLS-CATALOG.md`.

## Cost and context
Use the smallest set of agents needed. Avoid duplicate file scans, repeated audits, oversized reports, unnecessary parallelism, and repeated reads of unchanged documents. Keep handoffs concise and evidence-linked. Compact after meaningful milestones and before session handoff; preserve requirements, decisions, risks, test results, relevant paths, Git state, and next steps. Do not claim token savings without metrics.

## Changes and Git
Never overwrite unrelated user work. Prefer small, reviewable diffs. Use feature branches and isolated worktrees for truly parallel changes. Define file ownership and interfaces before parallel implementation. Do not force-push, reset destructively, discard another agent's changes, or commit secrets.

## Verification
Run relevant tests and report exact commands/results. A claim of success requires observed evidence. Distinguish PASS, FAIL, and BLOCKED. Never claim unrun tests, reviews, or deployments were completed.

## Security and production
Keep secrets out of code, logs, reports, prompts, and commits. Do not modify production data during tests. Production deploy requires configured infrastructure, passing gates, and required human approval. Do not disable security controls merely to complete a task.

## Source of truth
The orchestrator coordinates agents and consolidates updates to `contexto.md`; agents must not concurrently overwrite that shared file. Store larger evidence in `docs/reports/` and link it from the compact context.
