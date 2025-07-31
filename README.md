# AI-Powered Infrastructure Management Platform

## Project Overview
Building a platform that uses AI agents to manage and optimize infrastructure, incorporating AWS, Terraform, Kubernetes, agentic AI, and CI/CD.

## Project Structure
```
ai-infra-project/
├── terraform/
│   ├── bootstrap/          # Initial AWS setup (S3, DynamoDB, ECR, IAM)
│   ├── modules/           # Reusable Terraform modules
│   │   ├── networking/    # VPC, subnets, NAT gateways
│   │   ├── compute/       # EKS, EC2 configurations
│   │   ├── storage/       # EBS, EFS, S3 resources
│   │   └── cicd/         # GitHub runners setup
│   └── environments/      # Environment-specific configs
│       ├── dev/          # Development environment
│       ├── staging/      # Staging environment (future)
│       └── prod/         # Production environment (future)
├── kubernetes/
│   ├── infrastructure/    # Core K8s services (monitoring, ingress)
│   └── applications/      # AI agent deployments
├── applications/
│   └── ai-agents/        # Python AI agent code
├── .github/workflows/    # CI/CD pipelines
└── scripts/             # Helper scripts
```

## Project Phases

### ✅ Phase 1: Foundation Infrastructure (In Progress)
- [x] AWS account setup and configuration
- [x] Bootstrap infrastructure (S3 state, DynamoDB locking, ECR)
- [x] Remote state management
- [ ] VPC and networking deployment
- [ ] EKS cluster deployment
- [ ] GitHub runners setup

### 🔄 Phase 2: Add AI Capabilities (Planned)
- [ ] AI agent for cost monitoring
- [ ] Slack/Discord bot integration
- [ ] AWS Bedrock integration
- [ ] Basic monitoring dashboard

### 🔄 Phase 3: Advanced AI Features (Planned)
- [ ] Terraform state analyzer
- [ ] Auto-scaling recommendations
- [ ] Security compliance checker
- [ ] AI-generated infrastructure reports

### 🔄 Phase 4: Cross-Account & Advanced Networking (Planned)
- [ ] Staging/prod accounts
- [ ] Transit Gateway connections
- [ ] VPC endpoints
- [ ] Cross-account AI deployment manager

## Getting Started

### Prerequisites
- AWS CLI configured with appropriate credentials
- Terraform installed (version 1.5+)
- kubectl installed
- Docker installed
- GitHub account and repository

### Initial Setup

1. **Bootstrap Infrastructure**
   ```bash
   cd terraform/bootstrap
   terraform init
   terraform plan
   terraform apply
   ```

2. **Configure Remote State**
   - Update backend configuration with actual S3 bucket name
   - Migrate state: `terraform init -migrate-state`

3. **Deploy Main Infrastructure** (Next phase)
   ```bash
   cd terraform/environments/dev
   terraform init
   terraform plan
   terraform apply
   ```

## Architecture Decisions Made
- **Region:** eu-west-2 (Europe - London)
- **State Management:** S3 + DynamoDB for remote state
- **Container Registry:** ECR for Docker images
- **Authentication:** GitHub OIDC for secure CI/CD
- **Networking:** Multi-AZ setup with public/private subnets

## Cost Considerations
- **Bootstrap resources:** ~$2-5/month
- **EKS cluster:** ~$75/month (control plane + nodes)
- **NAT Gateways:** ~$135/month (multi-AZ setup)
- **Development usage:** Expected $100-150/month total

## Security Features
- Remote state encryption
- IAM roles with least privilege
- GitHub OIDC (no long-lived access keys)
- VPC Flow Logs for monitoring
- Resource tagging for cost tracking

## Learning Objectives
- Infrastructure as Code with Terraform
- Kubernetes orchestration with EKS
- CI/CD automation with GitHub Actions
- AI/ML integration with AWS Bedrock
- Production-ready DevOps practices

## Current Status
**Phase 1 - Foundation Infrastructure:** Setting up core AWS resources and networking.

**Next Session Goals:**
- Complete VPC and EKS deployment
- Set up GitHub runners on EKS
- Deploy first AI monitoring agent

## Useful Commands

### Terraform
```bash
# Plan changes
terraform plan

# Apply changes  
terraform apply

# Destroy resources
terraform destroy

# Format code
terraform fmt -recursive

# Validate configuration
terraform validate
```

### AWS CLI
```bash
# Check current identity
aws sts get-caller-identity

# List EKS clusters
aws eks list-clusters --region eu-west-2

# Configure kubectl
aws eks update-kubeconfig --region eu-west-2 --name cluster-name
```

### Kubernetes
```bash
# Get cluster info
kubectl cluster-info

# Get nodes
kubectl get nodes

# Get pods
kubectl get pods --all-namespaces
```

---

*This project is part of a comprehensive learning journey through modern DevOps and AI infrastructure practices.*