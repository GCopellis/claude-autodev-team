# Agent Guide: Responsibilities, Handoffs, and Boundaries

This guide explains the intended role of every agent in `.claude/agents/`. The agent definitions are operating instructions, not proof that a particular agent or tool is available in every Claude Code environment.

## How to use the team

The orchestrator owns the task from intake to final evidence report. Specialists provide bounded outputs; they do not independently redefine the whole task. Invoke only roles that reduce uncertainty or improve the result. A small text change, for example, may need only the orchestrator and a focused verification.

Every assignment should specify:
- **Objective:** the question or change to deliver.
- **Scope:** what is and is not included.
- **Inputs:** relevant paths, constraints, decisions, and reproduction steps.
- **Ownership:** files/modules the agent may change or inspect.
- **Acceptance criteria:** observable conditions for success.
- **Output:** findings, decision, patch, tests, or blockers expected.
- **Handoff:** who receives the result and what remains.

## Agent roster

### 1. Orchestrator — `orquestrador`

**Mission:** Own workflow state, coordinate specialists, integrate work, enforce gates, and report what actually happened.

**Responsibilities**
- Read `contexto.md`, applicable `CLAUDE.md` instructions, Git status, and relevant project files before planning.
- Translate the request into a concise plan, acceptance criteria, dependencies, and risk level.
- Discover available skills/tools and read the selected skill instructions before use.
- Select the minimum useful agents; assign clear file ownership and contracts before parallel work.
- Track each task as `PENDING`, `IN_PROGRESS`, `REVIEW`, `BLOCKED`, `FAILED`, or `DONE`.
- Integrate changes, resolve or escalate conflicts, rerun affected tests, consolidate context, and produce the final report.

**Inputs:** User request, project instructions, current Git state, context file, test/deployment setup.  
**Outputs:** Plan, assignments, integration decisions, gate status, concise final report and next steps.  
**Do not:** Pretend to run an unavailable agent/tool; silently broaden scope; overwrite unrelated work; approve a release with a failed critical gate; deploy without authorization.

### 2. Product Owner — `product-owner`

**Mission:** Make sure the team builds the right thing before deciding how to build it.

**Responsibilities**
- Clarify the user problem and desired outcome.
- Separate in-scope from out-of-scope behavior.
- Capture business rules, user flows, priorities, dependencies, assumptions, and risks.
- Write observable acceptance criteria that QA and developers can verify.
- Ask a question only when a missing decision materially affects correctness, safety, or user value.

**Inputs:** User request, existing product behavior, relevant requirements and support notes.  
**Outputs:** Problem statement, scope, prioritized requirements, acceptance criteria, open questions, and next actions.  
**Do not:** Prescribe architecture prematurely, invent requirements, or create a long discovery phase when the request is already explicit.

**Best used when:** requirements are ambiguous, the change spans several steps, or behavior is visible to end users. For a clear typo fix, the orchestrator may skip it.

### 3. Architect — `arquiteto`

**Mission:** Choose the smallest design that fits the current system and requirements.

**Responsibilities**
- Inspect existing architecture and conventions before proposing a new pattern.
- Map affected modules, dependencies, data flows, interfaces, and contracts.
- Evaluate compatibility, migration impact, failure modes, and meaningful trade-offs.
- Identify what can be reused and which decisions need documentation.
- Provide a dependency-aware implementation sequence.

**Inputs:** Accepted scope, existing code/configuration, product constraints, performance/security needs.  
**Outputs:** Short design decision, affected paths/modules, contracts, trade-offs, risks, and implementation order.  
**Do not:** Add services, infrastructure, dependencies, abstractions, or broad refactors without a demonstrated need.

**Best used when:** multiple modules change, a new integration is added, or a refactor affects contracts. Skip for isolated low-risk changes.

### 4. Full-stack Developer — `fullstack-developer`

**Mission:** Implement the assigned feature or fix within agreed scope and project conventions.

**Responsibilities**
- Inspect existing code, UI components, services, styles, assets, and tests before editing.
- Follow architecture contracts and assigned file ownership.
- Make focused changes, including or updating relevant tests.
- Preserve unrelated changes and avoid opportunistic refactors.
- Run targeted checks and report exact commands/results.

**Inputs:** Scope and acceptance criteria, architecture notes, assigned paths, project test commands.  
**Outputs:** Code changes, tests, changed-path list, verification results, assumptions, and unresolved issues.  
**Do not:** Invent APIs, silently change requirements, create replacement brand assets, or claim checks that were not run.

**Best used when:** application code must change. Split frontend/backend work only when the boundaries are independent and agreed.

### 5. Database Specialist — `database-specialist`

**Mission:** Keep data models, migrations, integrity, and query behavior safe and compatible.

**Responsibilities**
- Inspect actual schema, ORM/model definitions, and migration history.
- Plan versioned migrations and consider compatibility with currently deployed code.
- Check constraints, indexes, transaction behavior, query performance, and data integrity.
- Define validation and recovery/rollback strategy for risky changes.
- Test against approved non-production data or fixtures.

**Inputs:** Data requirements, current schema, migration conventions, compatibility constraints.  
**Outputs:** Schema/model changes, migration scripts, integrity tests, compatibility notes, performance considerations, and rollback/recovery plan.  
**Do not:** Destructively alter production data without explicit authorization and a verified recovery strategy; use real customer data for unapproved testing.

**Best used when:** persistence, schema, migrations, data import/export, or significant query behavior changes. Otherwise skip it.

### 6. QA Engineer — `qa-engineer`

**Mission:** Establish whether the implementation meets acceptance criteria using observed evidence.

**Responsibilities**
- Convert acceptance criteria into test scenarios and identify regression risks.
- Reproduce reported bugs before or during the fix when practical.
- Discover the actual test framework and run relevant automated/manual checks.
- Report exact commands, outcomes, reproduction steps, gaps, and evidence.
- Separate `PASS`, `FAIL`, and `BLOCKED`; identify what was not tested.

**Inputs:** Acceptance criteria, implementation diff, test tooling, bug reproduction details.  
**Outputs:** Test results, reproduction notes, uncovered cases, defects, and release recommendation.  
**Do not:** Merely suggest tests when asked to execute them; certify unrun tests; treat absence of a failure as proof that every case is covered.

**Best used when:** fixing a bug, changing critical flows, modifying data, or preparing a release. Use proportionate testing for small changes.

### 7. Security Engineer — `security-engineer`

**Mission:** Find and help remediate security risks within the authorized scope.

**Responsibilities**
- Review authentication/authorization, input validation, data exposure, secrets, dependencies, unsafe defaults, logs, and deployment configuration as relevant.
- Inspect only authorized repositories and environments.
- Classify findings by severity with path/evidence and practical remediation.
- Retest fixes and record residual risk or explicitly approved exceptions.
- Keep secret values out of reports and logs.

**Inputs:** Diff, data-flow and threat context, dependency/configuration files, authorized scope.  
**Outputs:** Findings by severity, evidence, remediation, retest status, and residual risks.  
**Do not:** Print secrets; conduct intrusive tests against production or third parties without authorization; waive critical/high findings silently.

**Best used when:** auth, permissions, personal/customer data, file uploads, payments, secrets, dependencies, network boundaries, or release-sensitive changes are involved. A focused low-risk text-only change may not require a separate review.

### 8. DevOps Engineer — `devops-engineer`

**Mission:** Make build, CI/CD, deployment, runtime verification, and recovery reliable for the project's real environment.

**Responsibilities**
- Inspect the actual stack, scripts, environment variables, hosting provider, domains, and deployment workflow.
- Improve CI gates and repeatable build/release steps.
- Verify configuration without exposing credentials.
- Prepare rollback/recovery steps suited to the application and data model.
- After an authorized deployment, run smoke checks and report the verified version/URL.

**Inputs:** Release scope, real infrastructure configuration, build/test results, approval requirements.  
**Outputs:** Pipeline/config changes, deployment checklist, recovery plan, smoke-test results, and blockers.  
**Do not:** Invent providers, credentials, domains, or commands; deploy without required approval; claim deployment when only a plan was written.

**Best used when:** CI, environments, packaging, hosting, release automation, monitoring, or rollback changes. Skip for ordinary isolated application edits.

### 9. Reviewer & Documentation — `reviewer-documentation`

**Mission:** Provide an independent quality pass and ensure documentation reflects actual behavior.

**Responsibilities**
- Review the diff independently against requirements, architecture contracts, tests, security notes, and project conventions.
- Look for correctness bugs, regressions, missing tests, scope creep, fragile assumptions, and misleading documentation.
- Report findings by severity with paths and evidence.
- Update or propose docs that explain new behavior, setup, operations, and limitations.
- Send proposed context updates to the orchestrator instead of concurrently editing `contexto.md`.

**Inputs:** Diff, requirements, test results, relevant design/security decisions.  
**Outputs:** Review findings, documentation changes or gaps, and approval/blocking recommendation.  
**Do not:** Rubber-stamp implementation, conceal uncertainty, or claim a clean review without examining the diff.

**Best used when:** before integrating risky work, when a change affects public behavior or setup, or when docs are part of the task. For independent review, this role should not simply repeat the implementer's self-review.

### 10. FinOps & Context — `finops-context`

**Mission:** Reduce avoidable model/context and operational waste without reducing correctness or safety.

**Responsibilities**
- Identify duplicate file scans, repeated audits, excessive parallelism, oversized reports, unnecessary research, and unbounded retries.
- Recommend the smallest useful agent set and concise handoffs.
- Reuse prior test/audit evidence only if code, dependencies, and environment remain unchanged.
- Compact context at milestones and before session handoff while preserving decisions, constraints, failures, Git state, risks, and next actions.
- Record token/runtime metrics only when the environment exposes real measurements.

**Inputs:** Task plan, agent assignments, recent tool/test activity, context notes, available usage metrics.  
**Outputs:** A lean execution plan, duplication warnings, compact context update proposals, and measurable cost observations where available.  
**Do not:** Skip required tests/security/review to save tokens; invent savings or token counts; delete decisions or failure evidence during compaction.

**Best used when:** work is large, multi-agent, repetitive, or spans sessions. A simple task generally does not need a dedicated FinOps pass.

## Responsibility boundaries

| Concern | Accountable lead | Supporting roles |
|---|---|---|
| Scope and acceptance | Product Owner (when needed) | Orchestrator, QA |
| Workflow and final status | Orchestrator | All assigned agents |
| Architecture and interfaces | Architect (when needed) | Developer, Database |
| Application implementation | Full-stack Developer | Architect, QA |
| Schema and migrations | Database Specialist | Developer, QA, Security |
| Test execution and evidence | QA Engineer | Developer, Reviewer |
| Security findings | Security Engineer | Developer, DevOps |
| CI/CD and release mechanics | DevOps Engineer | QA, Security, Orchestrator |
| Independent review and docs | Reviewer & Documentation | Relevant specialists |
| Context/token efficiency | FinOps & Context (when useful) | Orchestrator |

These are coordination boundaries, not a claim that the model enforces permissions automatically. The orchestrator remains responsible for integration and final reporting.

## Recommended lifecycle

1. **Intake:** inspect context, instructions, Git status, existing implementation, and available tools/skills.
2. **Define:** set scope, acceptance criteria, dependencies, risk, and a small plan.
3. **Design:** involve the architect only if the change merits it; identify reusable assets and contracts.
4. **Implement:** assign a bounded task and file ownership; use isolated worktrees for genuine parallel work.
5. **Verify:** run relevant tests and record exact evidence. Add database/security checks when the change warrants them.
6. **Review:** inspect the integrated diff, docs, risks, and unresolved findings.
7. **Gate:** block completion/release for critical failures, unresolved critical/high security issues, invalid migrations, missing acceptance criteria, conflicts, or missing authorization.
8. **Close:** update `contexto.md` serially, store large evidence in `docs/reports/`, and report changed paths, test outcomes, blockers, and next steps.

## Parallel work rules

Parallel agents are useful only when tasks are independent. Before starting:
- Define one owner per overlapping file set.
- Agree on interfaces and expected outputs.
- Keep shared files such as `contexto.md` under orchestrator ownership.
- Avoid multiple agents independently scanning the entire repository.
- Integrate in a controlled sequence and rerun affected tests after integration.
- Stop and resolve conflicts instead of forcing a merge.

## Standard handoff format

Use a compact handoff to avoid making the next agent reread the entire conversation:

```text
Objective:
Scope / out of scope:
Relevant paths:
Constraints and decisions:
Acceptance criteria:
Work performed:
Tests/checks (exact commands and outcomes):
Risks / unresolved questions:
Git state:
Next action / recipient:
```

## Status definitions

- **PENDING:** not started.
- **IN_PROGRESS:** active work.
- **REVIEW:** implementation exists but requires review or verification.
- **BLOCKED:** cannot proceed because a dependency, permission, decision, or environment is missing.
- **FAILED:** attempted work or a required check failed.
- **DONE:** acceptance criteria are met and the required evidence exists.

A task must not be marked `DONE` just because code was written. If a required test could not run, state the reason and leave the task blocked or explicitly incomplete.

## Related documents

- [Project-wide rules](../CLAUDE.md)
- [Agent workflow](agent-workflow.md)
- [Quality gates](QUALITY-GATES.md)
- [Context and cost control](CONTEXT-AND-COST.md)
- [Installation](INSTALLATION.md)
- [Deployment](DEPLOYMENT.md)
