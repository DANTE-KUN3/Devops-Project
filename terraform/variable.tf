variable "instance_type" {
  description = "The type of instance to create"
  type        = string
  default     = "t2.micro"
  
}

variable "tag" {    
    description = "Tag to assign to the instance"
    type        = string
    default     = "my-instance"
  
}

variable "ami" {
  description = "The AMI ID to use for the instance"
  type        = string
  default     = "ami-0c02fb55956c7d316" # Example AMI ID for Amazon Linux 2 in the us-east-1 region
  
}


variable "ip_config" {
  description = "The IP configuration for the EC2 instance"
    type = string
    default = "106.222.204.124/32"
  
  
}

variable "public_key" {
  description = "The public key to use for SSH access"
  type        = string
}