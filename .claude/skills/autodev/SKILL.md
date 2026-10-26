---
name: autodev
description: Coordinates a scoped software task through requirements, implementation, verification, review, and authorized release with minimal context waste.
argument-hint: "<task description>"
---

# /autodev

Task: $ARGUMENTS

## 1. Inspect and plan
- Read `contexto.md`, project instructions, Git status, relevant code/tests, and deployment setup.
- Inspect logos/assets, components, scripts, and docs before creating substitutes.
- Define scope and acceptance criteria; involve product-owner only when useful and architect for material architectural changes.

## 2. Select agents and skills
- Use only specialists needed for the task.
- Verify each agent/skill exists. Read instructions before invoking.
- Typical choices: fullstack for implementation; database specialist for schema; QA for tests; security for auth/data/dependencies; reviewer for independent review; DevOps for CI/release; FinOps for large or multi-agent tasks.
- Do not call every agent by default.

## 3. Implement
- Assign file/module ownership and contracts before parallel work.
- Parallelize only independent tasks; use worktrees only when supported and useful.
- Preserve user changes.
- Reuse working code and official assets.
- Add tests with behavior changes.

## 4. Verify and review
- Execute relevant tests/static checks.
- Obtain independent review for non-trivial changes.
- Fix findings and rerun impacted checks.
- Record PASS/FAIL/BLOCKED with exact evidence. Never claim unrun tests.

## 5. Release gate
Block production deployment if critical tests/build fail, critical/high security findings remain, migration validation is missing, conflicts remain, acceptance criteria are unmet, or authorization/configuration is missing. Do not invent providers or credentials.

## 6. Compact and report
- Update `contexto.md` serially through the orchestrator.
- Store long logs in `docs/reports/`; keep handoffs concise.
- Preserve requirements, decisions, modified paths, test commands/results, Git state, risks, blockers, and next steps.
- Report changes, verification, review/security status, deployment state, skills actually used, and unresolved blockers.
