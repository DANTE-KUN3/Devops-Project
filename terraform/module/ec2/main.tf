resource "aws_instance" "new" {
  ami                    = var.ami
  instance_type          = var.instance_type
  key_name               = var.key_name
  vpc_security_group_ids = var.security_group_ids

  user_data = <<-EOF
              #!/bin/bash
              sudo yum update -y
              sudo yum install gcc openssl-devel bzip2-devel libffi-devel zlib-devel -y
              cd /usr/src
              sudo wget https://www.python.org/ftp/python/3.8.10/Python-3.8.10.tgz
              sudo tar xzf Python-3.8.10.tgz
              cd Python-3.8.10
              sudo ./configure --enable-optimizations
              sudo make altinstall
              sudo alternatives --install /usr/bin/python3 python3 /usr/local/bin/python3.8 1
              sudo yum install python3-pip -y
              python3 --version
              pip3 --version
              EOF


  tags = {
    Name = "MyEC2"
  }
}