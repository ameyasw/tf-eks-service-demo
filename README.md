# Terraform EKS Service

## Overview

This repository contains a Terraform module that deploys a simple containerized application to an AWS EKS cluster, along with all required ancillary infrastructure.

The deployment includes:
- A VPC with public and private subnets
- An EKS cluster with a managed node group
- A Kubernetes Namespace
- A Kubernetes Deployment using a public container image (nginx)
- A Kubernetes Service of type `LoadBalancer`

The application is exposed publicly via an AWS‑managed load balancer.

---

## Prerequisites

Before starting, ensure you have the following installed and configured:

- **Terraform** >= 1.5
- **AWS CLI v2**
- **kubectl**
- AWS credentials configured locally (via `aws configure` or AWS SSO)

---

## Step‑by‑Step Deployment Instructions

### 1. Clone the Repository

```bash
git clone https://github.com/ameyasw/terraform-eks-service-demo.git
cd terraform-eks-service-demo/examples/basic
```

---

### 2. Initialize Terraform

```bash
terraform init
```

This downloads all required Terraform providers and modules.

---

### 3. Review the Plan

```bash
terraform plan
```

---

### 4. Deploy the Infrastructure and Application

```bash
terraform apply
```

Type `yes` when prompted.

Terraform will:
- Create the VPC and networking components
- Provision the EKS cluster and managed node group
- Configure cluster access
- Deploy the Kubernetes Namespace, Deployment, and Service

> **Note:**  
> During the first apply, Terraform creates the EKS cluster before configuring the Kubernetes provider.  
> This is expected behavior and is handled via dependency ordering in the module.

---

### 5. Configure kubectl Access

After apply completes, configure your local kubeconfig:

```bash
aws eks update-kubeconfig --region us-east-1 --name demo-eks
```

Verify cluster access:

```bash
kubectl get nodes
```

---

### 6. Verify the Application

Check the service:

```bash
kubectl get svc -n demo
```

Terraform also outputs the service endpoint:

```bash
terraform output service_url
```

Open the URL in a browser. You should see the **nginx welcome page**, confirming the deployment is working.

---

## Cleanup

To remove all resources:

```bash
terraform destroy
```

---

## Design Decisions

For this exercise, I used well‑established community Terraform modules for VPC and EKS to avoid re‑implementing commodity infrastructure and to focus on clean module composition and end‑to‑end deployment.

The application is deployed using the Terraform Kubernetes provider to keep the workflow fully declarative and reproducible with a single `terraform apply`. The service is exposed via a Kubernetes `Service` of type `LoadBalancer` for simplicity.

---

