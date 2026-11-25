# Terraform Infrastructure Automation

## Project Overview

This project demonstrates Infrastructure as Code
using Terraform, Docker and Kubernetes.

The infrastructure is deployed locally without
using paid AWS services.

## Technologies

- Terraform
- Docker
- Docker Network
- Kubernetes
- Kind
- GitHub Actions
- Nginx

## Architecture

Reusable Terraform modules are used to manage:

1. Network infrastructure
2. Docker compute containers
3. Kubernetes namespaces
4. Kubernetes deployments
5. Kubernetes services

## Project Structure

terraform-infrastructure-project/

├── modules/
│   ├── network/
│   ├── compute/
│   └── kubernetes/

├── envs/
│   ├── dev/
│   └── prod/

├── .github/workflows/
│   └── terraform.yml

├── .gitignore
└── README.md

## Prerequisites

- Ubuntu Linux
- Terraform
- Docker
- kubectl
- Kind
- Git

## 1. Start Kubernetes Cluster

kind create cluster --name terraform-lab

Verify:

kubectl get nodes

## 2. Deploy Development Environment

cd envs/dev

terraform init

terraform fmt -recursive

terraform validate

terraform plan

terraform apply

## 3. Verify Development

Docker application:

curl http://localhost:8080

Kubernetes:

kubectl get all -n dev

## 4. Deploy Production Environment

cd ../prod

terraform init

terraform fmt -recursive

terraform validate

terraform plan

terraform apply

## 5. Verify Production

Docker application:

curl http://localhost:8081

Kubernetes:

kubectl get all -n prod

## 6. Test Kubernetes Applications

Development:

kubectl port-forward \
  -n dev \
  svc/dev-app-service 8088:80

Open:

http://localhost:8088

Production:

kubectl port-forward \
  -n prod \
  svc/prod-app-service 8089:80

Open:

http://localhost:8089

## 7. Terraform State

Each environment maintains its own
local Terraform state.

- Dev state: envs/dev/terraform.tfstate
- Prod state: envs/prod/terraform.tfstate

The local Terraform backend supports
state locking.

This project does not use AWS S3
or DynamoDB.

## 8. Destroy Infrastructure

Development:

cd envs/dev
terraform destroy

Production:

cd ../prod
terraform destroy

Delete Kind cluster:

kind delete cluster --name terraform-lab

## 9. GitHub Actions

GitHub Actions automatically performs:

- Terraform formatting checks
- Terraform initialization
- Terraform validation
- Development plan
- Production plan

## Learning Outcomes

- Infrastructure as Code
- Reusable Terraform modules
- Environment separation
- Terraform state management
- Local state locking
- Docker networking
- Kubernetes deployments
- Kubernetes services
- Terraform CI/CD automation

## Cost

This project uses free open-source tools
and local resources.

No paid AWS infrastructure is created.
