variable "aws_region" {
  default = "us-east-1"
}

variable "ami_id" {
  description = "AMI ID for EC2"
  default = "ami-09c813fb71547fc4f"
}

variable "instance_type" {
  default = "t2.micro"
}
