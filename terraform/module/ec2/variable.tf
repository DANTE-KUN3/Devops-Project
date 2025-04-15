variable "instance_type" {
  type = string
}

variable "key_name" {
  description = "The name of the SSH key to use"
  type        = string
}

variable "security_group_ids" {
  description = "List of SG IDs to associate with the instance"
  type        = list(string)
}

variable "ami" {
  description = "AMI ID for the EC2 instance"
  type        = string
}
