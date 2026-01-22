Terraform Project

Overview

This project demonstrates a modular Terraform setup to provision AWS infrastructure in a clean, reusable way.
It uses three self-contained modules to create networking, compute, and storage resources, showing best practices in infrastructure-as-code and CI/CD with GitHub Actions.

Project Structure:
terraform-project/
├── main.tf
├── variables.tf
├── outputs.tf
├── modules/
│   ├── vpc/
│   ├── ec2/
│   └── s3/
├── .gitignore
├── README.md
└── .github/workflows/terraform.yml

Modules:
	•	VPC Module – Creates a custom VPC and a public subnet
	•	EC2 Module – Launches an EC2 instance with a security group scoped to the VPC
	•	S3 Module – Creates an S3 bucket with versioning enabled
Each module exposes outputs that are used by other modules or displayed in the workflow.

Usage:
clone the repo using this command
git clone https://github.com/danielshd/terraform-project.git
go inside the folde with : cd terraform-project

run these commands locally:
terraform init
terraform plan
terraform apply
terraform output
terraform destroy

Outputs:
After applying, you’ll see in the workflow or locally:
	•	EC2 public IP address
	•	S3 bucket name
	•	VPC and subnet IDs
