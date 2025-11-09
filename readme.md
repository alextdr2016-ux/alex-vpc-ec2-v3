# Alex VPC EC2 V3 - Terraform Infrastructure as Code

A complete Terraform project that provisions AWS infrastructure with VPC, EC2 instance, and networking components. This project includes automated CI/CD pipeline using GitHub Actions.

## 🎯 Project Overview

This Terraform project automates the creation of a complete AWS networking and compute infrastructure:

- **VPC (Virtual Private Cloud)** - Isolated network environment
- **Subnet** - Subnet within the VPC for EC2 placement
- **Internet Gateway** - Enable internet connectivity
- **Route Table** - Define network traffic rules
- **Security Group** - Firewall for EC2 instance
- **EC2 Instance** - Amazon Linux 2023 compute instance

## 📋 Architecture

```
AWS Account (eu-north-1)
├── VPC (10.0.0.0/16)
│   ├── Subnet (10.0.1.0/24)
│   │   └── EC2 Instance (t3.nano)
│   │       └── Security Group (SSH: 22)
│   ├── Internet Gateway
│   └── Route Table (0.0.0.0/0 → IGW)
```

## 🚀 Quick Start

### Prerequisites

- Terraform >= 1.0.0
- AWS CLI configured with credentials
- Git

### Usage

1. **Clone the repository**

```bash
git clone https://github.com/alextdr2016-ux/alex-vpc-ec2-v3.git
cd alex-vpc-ec2-v3
```

2. **Initialize Terraform**

```bash
terraform init
```

3. **Review the plan**

```bash
terraform plan
```

4. **Apply the configuration**

```bash
terraform apply
```

5. **Get outputs**

```bash
terraform output
```

## 📁 Project Structure

```
alex-vpc-ec2-v3/
├── main.tf              # Main Terraform configuration
├── variables.tf         # Variable definitions
├── outputs.tf           # Output values
├── terraform.tfvars     # Variable values
├── .gitignore           # Git ignore file
├── README.md            # This file
└── .github/
    └── workflows/
        └── deploy.yml   # GitHub Actions CI/CD pipeline
```

## 📝 Configuration Files

### variables.tf

Defines all input variables:

- `region` - AWS region (default: eu-north-1)
- `vpc_name` - VPC name
- `vpc_cidr` - VPC CIDR block (default: 10.0.0.0/16)
- `subnet_name` - Subnet name
- `subnet_cidr` - Subnet CIDR block (default: 10.0.1.0/24)
- `igw_name` - Internet Gateway name
- `route_table_name` - Route Table name
- `instance_type` - EC2 instance type (default: t3.nano)
- `ami_id` - Amazon Machine Image ID
- `security_group_name` - Security Group name
- `instance_name` - EC2 instance name

### terraform.tfvars

Contains the actual values for variables. **Do not commit this file** if it contains sensitive data.

### main.tf

Contains all AWS resources:

- aws_vpc
- aws_subnet
- aws_internet_gateway
- aws_route_table
- aws_route_table_association
- aws_security_group
- aws_instance

### outputs.tf

Displays important resource identifiers after deployment:

- VPC ID
- Subnet ID
- Internet Gateway ID
- Route Table ID
- Security Group ID
- EC2 Instance ID
- EC2 Public IP
- EC2 Public DNS
- AWS Region
- Availability Zone

## 🔄 CI/CD Pipeline

This project includes automated GitHub Actions workflow:

### Workflow Steps

1. **Terraform Format Check** - Validates code formatting
2. **Terraform Validate** - Checks syntax and references
3. **Terraform Plan** - Shows what will be created
4. **Terraform Apply** - Deploys infrastructure (only on push to main)

### Setup GitHub Secrets

Add these secrets to GitHub repository settings:

- `AWS_ACCESS_KEY_ID` - AWS IAM access key
- `AWS_SECRET_ACCESS_KEY` - AWS IAM secret key

The workflow triggers automatically on:

- Push to main branch
- Pull requests to main branch

## 📊 Outputs

After applying Terraform, you'll see:

```
vpc_id = "vpc-xxxxxxxxx"
subnet_id = "subnet-xxxxxxxxx"
internet_gateway_id = "igw-xxxxxxxxx"
route_table_id = "rtb-xxxxxxxxx"
security_group_id = "sg-xxxxxxxxx"
instance_id = "i-xxxxxxxxx"
instance_public_ip = "52.x.x.x"
instance_public_dns = "ec2-52-x-x-x.eu-north-1.compute.amazonaws.com"
region = "eu-north-1"
availability_zone = "eu-north-1a"
```

## 🔒 Security Notes

- SSH access (port 22) is open to 0.0.0.0/0 - Restrict this in production!
- Store sensitive data (terraform.tfvars, AWS credentials) safely
- Use AWS IAM roles instead of access keys when possible
- Enable versioning and encryption for state files in production

## 🗑️ Cleanup

To destroy all resources:

```bash
terraform destroy
```

Confirm when prompted. This will:

- Terminate EC2 instance
- Delete VPC and all associated resources
- Remove security groups and route tables

## 📚 Resources

- [Terraform AWS Provider Documentation](https://registry.terraform.io/providers/hashicorp/aws/latest/docs)
- [Terraform Documentation](https://www.terraform.io/docs)
- [GitHub Actions Documentation](https://docs.github.com/en/actions)
- [AWS VPC Documentation](https://docs.aws.amazon.com/vpc/)

## 🤝 Contributing

Feel free to fork and modify this project for your own use.

## 📝 License

This project is open source and available under the MIT License.

## 👨‍💻 Author

Created by Alex - Cloud Engineering Learning Project

---

**Last Updated:** 2025
