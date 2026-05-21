# Deployment Notes

## MVP Deployment Target

The intended live deployment target is Azure Container Apps.

This was selected because it provides a managed container platform with public ingress and lower operational overhead compared to running a full AKS cluster for a small assessment workload.

## Manual Deployment Flow

The manual deployment flow is:

1. Login to Azure CLI.
2. Build Docker image.
3. Push image to Azure Container Registry.
4. Run Terraform.
5. Verify public endpoint.

## CI/CD Deployment Flow

The CI/CD deployment flow is:

1. Push commit to main.
2. GitHub Actions builds the Docker image.
3. GitHub Actions pushes the image to Azure Container Registry.
4. GitHub Actions runs Terraform.
5. GitHub Actions smoke-tests the /health endpoint.

## Why Kubernetes Is Not the First Live Target

The assessment asks for Kubernetes as a nice-to-have. For this submission, the live MVP is intentionally kept lightweight using Azure Container Apps.

Kubernetes and ArgoCD examples are included to demonstrate how this service could be promoted into a GitOps-managed Kubernetes environment.

## Future Production Design

For production, I would consider:

- AKS with workload identity
- ArgoCD for GitOps
- ExternalDNS
- cert-manager
- Azure Application Gateway or NGINX Ingress Controller
- Prometheus and Grafana
- Centralised logging
- SLO-based alerting
- Vulnerability scanning in CI/CD
- Remote Terraform state with locking
- Separate dev, staging, and production environments
