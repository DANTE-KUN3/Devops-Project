provider "aws" {
  region = "us-east-1"  # Change this to your desired AWS region
}

resource "aws_instance" "ec2_with_python" {
  ami                    = "ami-0c55b159cbfafe1f0"  # Replace with the correct Amazon Linux 2 AMI ID for your region
  instance_type          = "t2.micro"  # Choose your instance type
  key_name               = "my-key"  # Replace with your key name
  vpc_security_group_ids = ["sg-0123456789abcdef0"]  # Replace with your security group ID
  subnet_id              = "subnet-0123456789abcdef0"  # Replace with your subnet ID

  # User data to install Python
  user_data = <<-EOF
              #!/bin/bash
              # Update the system
              sudo yum update -y
              
              # Install dependencies
              sudo yum install gcc openssl-devel bzip2-devel libffi-devel zlib-devel -y
              
              # Download and extract the latest Python version (example with Python 3.9)
              cd /usr/src
              sudo wget https://www.python.org/ftp/python/3.9.7/Python-3.9.7.tgz
              sudo tar xzf Python-3.9.7.tgz
              cd Python-3.9.7
              
              # Configure and install Python 3.9
              sudo ./configure --enable-optimizations
              sudo make altinstall
              
              # Install pip for Python 3.9
              curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
              sudo python3.9 get-pip.py

              # Set Python 3.9 as the default Python version
              sudo alternatives --install /usr/bin/python3 python3 /usr/local/bin/python3.9 1

              # Verify the Python version
              python3 --version
              pip3 --version
              EOF

  tags = {
    Name = "EC2-Python-Install"
  }
  }
