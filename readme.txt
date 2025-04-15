# DevOps Automation Project

## Overview
This project automates the process of provisioning EC2 instances using Terraform on AWS. Additionally, it configures the instances with Ansible for software installation and setup.

## Prerequisites

Before running the automation, ensure the following:

1. **AWS CLI** is configured on your local machine or GitHub Actions with appropriate AWS Access Keys.
2. **Terraform** is installed (version 1.0.0 or later).
3. **Ansible** is set up locally or in the GitHub Actions environment.
4. **Python 3.8 or later** installed on EC2 instance for Ansible to work.

## Directory Structure

- `terraform/` - Contains the Terraform files for provisioning EC2 instance and configuring the AWS resources.
  - `main.tf` - Main Terraform configuration file.
  - `variables.tf` - Defines variables for the EC2 instance and other resources.
  - `outputs.tf` - Outputs the public IP and other information after the Terraform apply.
  
- `ansible/` - Contains the Ansible configuration files.
  - `inventory.ini` - Inventory file for the Ansible playbook.
  - `ansible.cfg` - Ansible configuration file.
  - `playbook.yml` - Ansible playbook for configuring the EC2 instance.
  
## Setup and Deployment

### 1. Set up AWS and Terraform

1. Clone the repository to your local machine:
   ```bash
   git clone <repository-url>
   cd <repository-name>
