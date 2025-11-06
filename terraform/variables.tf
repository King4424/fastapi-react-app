variable "aws_region" {
type = string
default = "ap-south-1"
}


variable "cluster_name" {
type = string
default = "fastapi-react-eks"
}


variable "vpc_cidr" {
type = string
default = "10.0.0.0/16"
}


variable "public_subnets" {
type = list(string)
default = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
}


variable "private_subnets" {
type = list(string)
default = ["10.0.11.0/24", "10.0.12.0/24", "10.0.13.0/24"]
}


variable "node_group_desired_capacity" {
type = number
default = 2
}


variable "node_instance_type" {
type = string
default = "t2.large"
}


variable "admin_ssh_key" {
description = "Optional EC2 key pair name for node SSH access (create in AWS if using)"
type = string
default = ""
}


# Optional remote state vars
variable "tf_state_bucket" {
type = string
default = ""
}


variable "tf_state_key" {
type = string
default = "terraform/eks.tfstate"
}