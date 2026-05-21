# Architecture

## High-Level Architecture

    Developer
        |
        | git push
        v
    GitHub Repository
        |
        | GitHub Actions
        | - Build Docker image
        | - Push image to Azure Container Registry
        | - Run Terraform
        | - Deploy Azure Container App
        | - Smoke test /health
        v
    Azure Subscription
        |
        +-- Resource Group: rg-lineten-sre-assessment
            |
            +-- Azure Container Registry
            |
            +-- Log Analytics Workspace
            |
            +-- Azure Container Apps Environment
            |
            +-- Azure Container App
                    |
                    +-- Public HTTPS endpoint
                    +-- FastAPI container
                    +-- /health
                    +-- /ready
                    +-- /version

## Terraform State

Terraform state is stored remotely in Azure Storage.

    Azure Storage Account
        |
        +-- Blob Container: tfstate
            |
            +-- lineten-sre-assessment.tfstate

This allows both local Terraform and GitHub Actions to operate against the same infrastructure state.

## Runtime

The application runs as a Docker container on Azure Container Apps.

The container listens on port 8000 and exposes HTTP endpoints used for health verification and deployment validation.

## CI/CD

Every push to the `main` branch triggers GitHub Actions.

The pipeline builds an amd64 Docker image, pushes it to Azure Container Registry, applies Terraform, and performs a smoke test against the public health endpoint.
