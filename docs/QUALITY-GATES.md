# Quality gates

Every gate is PASS, FAIL, or BLOCKED with evidence. Never mark PASS without checking the named verification.

## A — Scope
- Acceptance criteria written.
- Dependencies and boundaries known.

## B — Design
- Contracts and affected modules identified for substantial changes.
- Existing assets and components inspected.

## C — Implementation
- Code matches scope.
- Relevant tests added/updated.
- No unrelated destructive changes.

## D — Integration
- Diff reviewed.
- No unresolved conflicts.
- Available build, tests, lint/type checks run.
- Relevant integration/regression checks pass.

## E — Security
- Relevant security/dependency checks run.
- No unresolved critical/high finding without an explicitly authorized documented exception.
- No secrets committed.

## F — Homologation
- Critical flows checked in an appropriate environment.
- Migrations and configuration validated.

## G — Release
- Provider/target and secrets configured through approved secret storage.
- Required approvals present.
- Recovery strategy exists when relevant.
- Rollback is ready.
- Smoke tests run after deployment.

## H — Handoff
- Context/docs updated.
- Commit/version and evidence linked.
- Remaining issues and blockers stated.

Missing tool, environment, credential, or permission means BLOCKED, not PASS. Do not deploy to prove the workflow works.
