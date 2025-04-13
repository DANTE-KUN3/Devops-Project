provider "aws" {
  region = "us-east-1"
}

# ✅ Upload local public key to AWS
resource "aws_key_pair" "key" {
  key_name   = "my-key"
  public_key = file("my-key.pub")  
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

