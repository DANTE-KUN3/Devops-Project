resource "aws_instance" "new" {
  ami                    = var.ami
  instance_type          = var.instance_type
  key_name               = var.key_name
  vpc_security_group_ids = var.security_group_ids

  user_data = <<-EOF
              #!/bin/bash
              # Update system
              sudo yum update -y

              # Install dependencies to compile Python from source
              sudo yum install gcc openssl-devel bzip2-devel libffi-devel zlib-devel -y

              # Install Python 3.8 using yum (Amazon Linux 2 supports Python 3.8)
              sudo yum install python3.8 -y

              # Create a symbolic link to make Python 3 the default
              sudo ln -sf /usr/bin/python3.8 /usr/bin/python
              sudo ln -sf /usr/bin/pip3 /usr/bin/pip

              # Install pip for Python 3.8
              sudo curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
              sudo python3.8 get-pip.py

              # Verify Python and pip installations
              python --version
              pip --version
              EOF


  tags = {
    Name = "MyEC2"
  }
}