# Decision 0001: Invoke only agents needed

Status: Accepted

Invoking all nine specialists for every task increases latency, context use, and cost. The orchestrator selects the smallest set needed based on scope, risk, and dependencies. Add independent review/security for material risk or release readiness, not by default for trivial edits.

Consequences: less overhead on simple changes; task classification and acceptance criteria are required; applicable quality/security gates remain mandatory.
