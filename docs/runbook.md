# SRE Runbook

## Service

LineTen SRE Assessment API

## Purpose

This runbook describes how to verify, operate, troubleshoot, and rollback the assessment application.

## Endpoints

| Endpoint | Purpose |
|---|---|
| `/` | Main application response |
| `/health` | Liveness health check |
| `/ready` | Readiness check |
| `/version` | Application version |

## Local Verification

Run the application locally:

    docker compose up --build

Verify health:

    curl http://localhost:8000/health

Expected health response:

    {
      "status": "healthy"
    }

## Deployment Verification

After deployment, verify the public endpoint:

    curl https://<app-url>/
    curl https://<app-url>/health

## Rollback

Rollback options:

1. Revert the latest Git commit and allow CI/CD to redeploy.
2. Redeploy a previous known-good container image tag.
3. Update the Terraform container_image variable to a previous image tag and apply.

## Common Failure Scenarios

### Container fails to start

Check:

- Container image exists in registry
- Application is listening on port 8000
- Container App revision logs
- Environment variables

### Health check fails

Check:

- /health endpoint response
- Container App latest revision status
- Recent code or image changes
- Ingress configuration

### Pipeline fails

Check:

- GitHub Actions logs
- Azure authentication
- Azure Container Registry login
- Terraform formatting
- Terraform validation
- Docker build errors

## Operational Notes

The application exposes separate liveness and readiness endpoints. In Kubernetes, these are used by liveness and readiness probes to improve workload reliability.

For production, this service should be extended with metrics, structured logs, alerting rules, and SLO-based monitoring.
