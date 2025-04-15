resource "aws_instance" "new" {
  ami                    = var.ami
  instance_type          = var.instance_type
  key_name               = var.key_name
  vpc_security_group_ids = var.security_group_ids

   user_data = <<-EOF
              #!/bin/bash
              # Update packages
              apt-get update -y
              # Install Python and pip
              apt-get install -y python3 python3-pip
              EOF

  tags = {
    Name = "MyEC2"
  }
}