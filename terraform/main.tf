
terraform {
  backend "s3" {
    bucket         = "bee2025"
    key            = "terraform.tfstate"
    region         = "us-west-2"
    encrypt        = true
    use_lockfile = true

  }
}

provider "aws" {
  region = "us-east-1"
}


resource "aws_key_pair" "key" {
  key_name   = "my-key"
  public_key = var.public_key 
}

# ✅ Security group module
module "sg" {
  source = "./module/sg"
    ip_config = var.ip_config
}

# ✅ EC2 module
module "ec2" {
  source              = "./module/ec2"
  ami                 = var.ami
  instance_type       = var.instance_type
  key_name            = "my-key"
  security_group_ids  = [module.sg.web_sg_id]

  
}

#new