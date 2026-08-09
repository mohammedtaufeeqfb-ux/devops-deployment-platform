# Terraform Infrastructure

## Objective

Provision AWS infrastructure using Terraform following Infrastructure as Code (IaC) principles.

# Phase 1 - Networking

Objective:
Create reusable AWS networking infrastructure using Terraform.

Resources:

- VPC
- Public Subnets
- Private Subnets
- Internet Gateway
- Route Tables

Purpose:

Provide a secure and scalable foundation for Amazon EKS workloads.

Key Benefits:

- Infrastructure as Code
- Repeatable deployments
- Version-controlled infrastructure
- Multi-AZ architecture

## VPC

Resource:
- AWS VPC

CIDR:
- 10.0.0.0/16

Purpose:
Provide an isolated network boundary for Kubernetes workloads and AWS infrastructure.

Why:
All EKS nodes, load balancers, and application components require networking and routing.


## Subnet Design

Public Subnets:
- Host internet-facing resources such as Application Load Balancers.

Private Subnets:
- Host Kubernetes worker nodes and application workloads.

Benefits:
- Improved security
- High availability across Availability Zones
- Separation of public and private resources

## Networking Foundation

Implemented AWS networking foundation using Terraform modules.

Resources:
- VPC
- Public Subnets across 2 AZs
- Private Subnets across 2 AZs
- Internet Gateway
- Public Route Table

Outcome:
- Multi-AZ architecture
- Public/Private network segregation
- EKS-ready network design