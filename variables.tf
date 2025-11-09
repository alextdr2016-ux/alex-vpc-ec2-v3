variable "region" {
  description = "eu-north-1"
  type        = string
  default     = "eu-north-1"
}

variable "vpc_name" {
  description = "alex_vpc_v3."
  type        = string
  default     = "alex_vpc_v3"
}

variable "vpc_cidr" {
  description = "10.0.0.0/16"
  type        = string
  default     = "10.0.0.0/16"
}

variable "subnet_name" {
  description = "alex_subnet_v3"
  type        = string
  default     = "alex_subnet_v3"
}

variable "subnet_cidr" {
  description = "10.0.1.0/24"
  type        = string
  default     = "10.0.1.0/24"
}

variable "igw_name" {
  description = "alex_igw_v3"
  type        = string
  default     = "alex_igw_v3"
}

variable "route_table_name" {
  description = "alex_route_table_v3"
  type        = string
  default     = "alex_route_table_v3"
}

variable "instance_type" {
  description = "t3.nano"
  type        = string
  default     = "t3.nano"
}

variable "ami_id" {
  description = "Amazon liniux 2023"
  type        = string
  default     = "ami-07fb0a5bf9ae299a4" # Example AMI ID, replace with a valid one for your region if needed
}

variable "security_group_name" {
  description = "alex_sg_v3"
  type        = string
  default     = "alex_sg_v3"
}

variable "instance_name" {
  description = "alex_instance_v3"
  type        = string
  default     = "alex_instance_v3"
}