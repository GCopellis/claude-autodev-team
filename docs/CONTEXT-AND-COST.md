# Context and cost controls

Minimize avoidable token usage, tool calls, latency, and repeated work without weakening tests, security, or acceptance criteria.

- Select the smallest useful set of agents.
- Delegate only independent units with explicit outputs and done criteria.
- Read only relevant files; do not reread unchanged large files without reason.
- Store long logs in files and link them.
- Reuse valid test/audit evidence if code, dependencies, and environment are unchanged.
- Cap retries; every retry must use new evidence or a changed hypothesis.
- Avoid nested orchestrators and redundant reviews.
- Use economical models for routine tasks where supported; reserve stronger reasoning for complex/high-impact work.
- Do not claim usage measurements unless supported by trustworthy metrics.

## Compact state
Keep `contexto.md` short: current goal/milestone, branch/Git state, decisions, modified paths/commits, tests/results, review/security status, risks, blockers, next steps, deployment status only if verified.

Put long output in `docs/reports/` or decision docs. Reference it rather than repeating it.

Compact after substantial tasks, before handoff, when context grows, and after long debugging. Preserve requirements, decisions, failures, risks, paths, Git state, and the next action. Use `caveman-compress` only if present and only after reading its instructions.

Record actual metrics when available. Otherwise report observable proxies such as retries and agents invoked. Never fabricate token savings.
