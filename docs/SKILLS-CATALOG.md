# Skills catalog and routing

This is a starting selection policy based on skills reported by the original author. It does not prove a skill is installed on a given machine.

## Discovery contract
1. Discover exact skill name and path locally.
2. Read its instructions.
3. Check prerequisites and compatibility.
4. Invoke/follow its instructions.
5. Record it as used only if actually followed.

Skip missing skills and record an alternative if useful. Do not call every skill on every task.

## Role routing

| Role | Candidate skills (verify locally) | When |
|---|---|---|
| Product Owner | `using-superpowers`, `brainstorming`, `writing-plans`, `user-research`, `research-synthesis`, `ux-copy` | Requirements, plan, UX copy |
| Architect | `graphify`, `context7-mcp`, `investigate-first`, `lean-build`, `migration`, `safe-refactor` | Architecture and dependencies |
| Full-stack | `test-driven-development`, `subagent-driven-development`, `dispatching-parallel-agents`, `surgical-patch`, `safe-refactor`, `simplify` | Implementation and tests |
| Database | `migration`, `investigate-first`, `context7-mcp`, `verification-before-completion` | Schema and migrations |
| QA | `verification-before-completion`, `systematic-debugging`, `test-driven-development`, `code-review`, `verify-and-stop` | Test and diagnose |
| Security | `security-audit`, `security-review`, `ponytail-audit`, `ponytail-debt` | Security reviews |
| DevOps | `ci-pipeline-and-gates`, `verification-before-completion`, `release-and-store-shipping` | CI and release |
| Reviewer/docs | `code-review`, `requesting-code-review`, `receiving-code-review`, `ponytail-review`, `caveman-evidence-review`, `writing-skills` | Review and docs |
| FinOps/context | `caveman-compress`, `caveman-stats`, `caveman-optimize`, `ponytail-gain`, `verify-and-stop` | Reduce waste and compact state |

## Cross-cutting
- `graphify`: dependency/architecture map if useful.
- `context7-mcp`: current library docs where installed.
- `security-audit` / `security-review`: relevant security gates.
- `using-git-worktrees`: genuinely parallel isolated tasks.
- `verification-before-completion`: evidence-based completion.
- `caveman-compress`: context compression only after reading instructions.
- `caveman-stats`: report stats only if exposed by installed tooling.
- `ponytail-audit`, `ponytail-debt`, `ponytail-gain`, `ponytail-review`: use according to actual instructions.
- `cavecrew`: only if compatible with the main orchestrator; avoid competing coordination.
- `fewer-permission-prompts`: never bypass safety or grant broad access unnecessarily.

## Technology-conditional skills
For Flutter/Dart, select relevant skills from `dart-flutter`, `vgv-ai-flutter-plugin`, and `flutter` (architecture, analysis, tests, accessibility, navigation, localization, dependency hygiene, security, release). Do not use Flutter skills for unrelated web projects.

For UX/interface work, consider `design-system`, `design-critique`, `design-handoff`, `accessibility-review`, and `design-branding`. For mobile flows, use relevant installed `mobile-app-design` skills.

Use `artifact-*`, `docx`, `pdf`, `pptx`, or `xlsx` only when required. Discover other names locally; don't assume similarly named tools are interchangeable.
