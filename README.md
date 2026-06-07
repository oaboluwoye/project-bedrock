# Project Bedrock - AltSchool Africa Cloud Engineering Capstone

## Overview

Project Bedrock is a cloud-native retail application platform deployed on AWS using Infrastructure as Code (Terraform), Kubernetes (Amazon EKS), managed database services, serverless computing, observability tooling, and CI/CD automation.

The project demonstrates the deployment and management of a production-style microservices application using AWS cloud services and DevOps best practices.

---

## Architecture

### Infrastructure Components

* Amazon VPC
* Public and Private Subnets
* Internet Gateway
* NAT Gateway
* Amazon EKS Cluster
* EKS Managed Node Group
* AWS Load Balancer Controller
* Amazon S3
* AWS Lambda
* Amazon DynamoDB
* Amazon RDS MySQL
* Amazon RDS PostgreSQL
* Amazon CloudWatch
* AWS IAM
* GitHub Actions

### Application Components

The Retail Store Sample Application consists of:

* UI Service
* Catalog Service
* Cart Service
* Checkout Service
* Orders Service
* Assets Service

---

## Infrastructure Provisioning

Infrastructure was provisioned using Terraform.

### Key Terraform Resources

| Resource       | Purpose                     |
| -------------- | --------------------------- |
| VPC            | Network foundation          |
| EKS            | Kubernetes platform         |
| S3             | Asset storage               |
| Lambda         | Event-driven processing     |
| DynamoDB       | Managed NoSQL database      |
| RDS MySQL      | Managed relational database |
| RDS PostgreSQL | Managed relational database |
| IAM            | Access control              |
| CloudWatch     | Monitoring and logging      |

---

## Kubernetes Deployment

The Retail Store Sample Application was deployed to Amazon EKS using Helm.

### Namespace

```bash
retail-app
```

### Verification

```bash
kubectl get pods -n retail-app
kubectl get ingress -n retail-app
kubectl get svc -n retail-app
```

---

## Application Access

The application is exposed through an AWS Application Load Balancer (ALB).

Example:

```text
Application URL:

http://k8s-retailap-retailui-dd768ff5c0-1640246332.us-east-1.elb.amazonaws.com/home
```

A screenshot of the running application is included in the screenshots folder.

---

## Serverless Implementation

### Amazon S3

Bucket:

```text
bedrock-assets-olaoluwa
```

### AWS Lambda

Function:

```text
bedrock-asset-processor
```

### Workflow

1. User uploads file to S3
2. S3 triggers Lambda
3. Lambda processes uploaded object
4. Execution logs are written to CloudWatch

The integration was successfully tested using sample file uploads.

---

## Data Layer

### Amazon DynamoDB

Table:

```text
bedrock-products
```

### Amazon RDS MySQL

Instance:

```text
bedrock-mysql
```

### Amazon RDS PostgreSQL

Instance:

```text
bedrock-postgres
```

Database credentials are securely stored in AWS Secrets Manager.

---

## Security

### IAM User

```text
bedrock-dev-view
```

Permissions:

* AWS ReadOnlyAccess
* AmazonEKSViewPolicy

The user is restricted to viewing resources within the retail-app namespace and cannot perform administrative actions.

---

## Observability

### Amazon CloudWatch

Enabled features:

* EKS Control Plane Logs
* Container Insights
* Application Logs
* Lambda Logs

Container Insights log groups:

```text
/aws/containerinsights/project-bedrock-cluster/application
/aws/containerinsights/project-bedrock-cluster/dataplane
/aws/containerinsights/project-bedrock-cluster/host
/aws/containerinsights/project-bedrock-cluster/performance
```

---

## CI/CD

GitHub Actions was configured to automate Terraform workflows.

Pipeline stages:

1. Terraform Init
2. Terraform Validate
3. Terraform Plan
4. Terraform Apply

AWS credentials are securely stored using GitHub Actions Secrets.

---

## Project Structure

```text
project-bedrock/
├── terraform/
├── k8s/
├── lambda/
├── screenshots/
├── grading.json
├── README.md
└── .github/workflows/
```

---

## Screenshots

The screenshots directory contains evidence of:

* Terraform deployment
* EKS cluster
* Kubernetes workloads
* ALB ingress
* Retail application
* Lambda execution
* DynamoDB
* RDS databases
* CloudWatch logging
* GitHub Actions
* EKS access controls

---

## Challenges Encountered

* EKS managed node group creation failures
* AWS Load Balancer Controller configuration
* CloudWatch Observability permissions
* Git repository cleanup due to large Terraform provider files
* GitHub Actions execution against existing infrastructure

These issues were investigated and resolved during implementation.

## Lessons Learned

This project provided practical experience with deploying and managing cloud-native applications on AWS using Terraform and Kubernetes. Key learning areas included troubleshooting EKS node provisioning, configuring AWS Load Balancer Controller, implementing observability with CloudWatch Container Insights, managing IAM permissions, and automating infrastructure deployment using GitHub Actions.

---

## Author

Olaoluwa Aboluwoye

AltSchool Africa Cloud Engineering Program

2026
