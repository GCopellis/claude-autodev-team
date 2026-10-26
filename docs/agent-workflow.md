# Orchestration model

Nine specialist roles: Product Owner/Requirements, Architect, Full-stack Developer, Database Specialist, QA, Security, DevOps, Independent Reviewer/Documentation, and FinOps/Context.

These are responsibilities, not a mandate to invoke all agents for every task.

Small task: orchestrator -> implementer -> targeted tests -> review when risk warrants -> update context.

Substantial feature: requirements -> architecture/contracts -> implementation (parallel only for independent modules) -> integration -> tests -> security/review -> homologation -> authorized deployment -> handoff.

The orchestrator serially consolidates `contexto.md`. Each task records ID, owner, acceptance criteria, dependencies, file ownership, state (PENDING/IN_PROGRESS/REVIEW/BLOCKED/FAILED/DONE), evidence, commit, and next action.

On failure, capture actual error, assign owner, change hypothesis/code, rerun affected checks, and cap retries. Missing credentials/tools/approval means stop and report blocker.
