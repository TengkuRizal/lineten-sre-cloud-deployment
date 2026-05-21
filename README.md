# LineTen SRE Assessment

## Overview

This repository contains a small FastAPI application containerised with Docker and prepared for cloud deployment using Terraform and CI/CD.

The focus of this project is not the application complexity, but how the application becomes cloud-enabled through containerisation, infrastructure as code, automated deployment, public ingress, operational health checks, and clear documentation.

## Live Endpoint

Application:

https://ca-lineten-sre-assessment.proudrock-4130499c.southeastasia.azurecontainerapps.io

Health check:

https://ca-lineten-sre-assessment.proudrock-4130499c.southeastasia.azurecontainerapps.io/health

## Application Endpoints

| Endpoint | Purpose |
|---|---|
| `/` | Main application response |
| `/health` | Liveness health check |
| `/ready` | Readiness check |
| `/version` | Application version |

## Local Development

Run the application locally using Docker Compose:

```bash
docker compose up --build
