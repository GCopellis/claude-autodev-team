# Deployment guidance

This kit does not assume a hosting provider, domain, cloud account, or release command.

Before deployment, identify the actual provider/process. Store secrets in approved provider secret storage, not committed files. Validate build, required tests, security findings, migrations, health checks, backups/recovery, and rollback.

Deploy only when the target and command are verified, gates pass, credentials/permissions exist, required approval is present, and recovery is documented. Afterward, run smoke checks and record the verified version/commit, time, and URL. Missing setup means BLOCKED; never claim deployment occurred if only a pipeline was prepared.
