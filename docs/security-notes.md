# Security Notes

## Secrets

Secrets are not stored in the repository.

GitHub Actions uses repository secrets for:

- `AZURE_CREDENTIALS`
- `ACR_NAME`
- `ACR_LOGIN_SERVER`

## Azure Authentication

The CI/CD pipeline authenticates to Azure using a service principal stored securely in GitHub Actions secrets.

## Terraform State

Terraform state is stored in an Azure Storage backend instead of being committed to the repository.

The `.gitignore` file excludes local Terraform state files.

## Container Image

The Docker image is built explicitly for `linux/amd64` to ensure compatibility with Azure Container Apps.

## Production Improvements

For production, the following improvements are recommended:

- Use GitHub OIDC instead of a long-lived service principal secret
- Use managed identity for ACR pull access
- Restrict network access where possible
- Add container vulnerability scanning
- Add dependency scanning
- Add structured logging
- Add alerting and SLO monitoring
- Use separate environments for dev, staging, and production
