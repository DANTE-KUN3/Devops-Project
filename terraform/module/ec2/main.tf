resource "aws_instance" "new" {
  ami                    = var.ami
  instance_type          = var.instance_type
  key_name               = var.key_name
  vpc_security_group_ids = var.security_group_ids

    user_data = <<-EOF
              #!/bin/bash
              # Update packages
              apt-get update -y
              # Install dependencies to add Python repository
              apt-get install -y software-properties-common

              # Add the deadsnakes PPA which contains newer Python versions
              add-apt-repository ppa:deadsnakes/ppa
              apt-get update -y

              # Install Python 3.8 or later
              apt-get install -y python3.8 python3.8-distutils python3.8-venv

              # Ensure pip for Python 3.8 is installed
              apt-get install -y python3-pip

              # Verify the Python version
              python3.8 --version
              EOF

  tags = {
    Name = "MyEC2"
  }
}