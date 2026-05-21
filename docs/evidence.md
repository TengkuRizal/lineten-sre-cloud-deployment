# Assessment Evidence

## Repository

Repository:

    https://github.com/TengkuRizal/lineten-sre-cloud-deployment

## Live Azure Endpoint

Application endpoint:

    https://ca-lineten-sre-assessment.proudrock-4130499c.southeastasia.azurecontainerapps.io

Health endpoint:

    https://ca-lineten-sre-assessment.proudrock-4130499c.southeastasia.azurecontainerapps.io/health

## Verified Endpoint Responses

Application endpoint:

    curl -i https://ca-lineten-sre-assessment.proudrock-4130499c.southeastasia.azurecontainerapps.io/

Expected:

    HTTP/2 200
    {"message":"Hello LineTen","service":"lineten-sre-assessment","version":"1.0.0","status":"running"}

Health endpoint:

    curl -i https://ca-lineten-sre-assessment.proudrock-4130499c.southeastasia.azurecontainerapps.io/health

Expected:

    HTTP/2 200
    {"status":"healthy","timestamp":"..."}

## Implemented Requirements

- Application containerised using Docker
- Local runtime available through Docker Compose
- Infrastructure managed using Terraform
- Terraform remote state configured using Azure Storage backend
- Container image pushed to Azure Container Registry
- Application deployed to Azure Container Apps
- Public endpoint exposed for review
- GitHub Actions pipeline configured for deployment on commit
- Post-deployment smoke test included in CI/CD
- Kubernetes manifests included as examples
- ArgoCD Application manifest included as GitOps example
- README, runbook, and deployment notes included

## Operational Evidence

The service exposes:

- `/`
- `/health`
- `/ready`
- `/version`

The Kubernetes example includes:

- Deployment
- Service
- Ingress
- Readiness probe
- Liveness probe
- Resource requests and limits

The GitHub Actions workflow includes:

- Docker build
- Azure login
- ACR login
- Docker push
- Terraform init
- Terraform validate
- Terraform plan
- Terraform apply
- Smoke test against `/health`
