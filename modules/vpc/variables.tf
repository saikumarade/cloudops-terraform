variable "vpc_name" {
  default     = "sphere-vpc"
  type        = string
  description = "vpc name"
}
variable "vpc_cidr" {
  default     = "10.0.0.0/16"
  description = "cidr blocks for vpc"

}
variable "environment" {
  default     = "dev"
  type        = string
  description = "environment name"

}

variable "igw_name" {
    default = "sphere-igw"
    type = string
    description = "igw"

}
variable "public_subnet_a_name" {
    default     = "sphere-ps-1"
    type        = string
   description = "ps name"
  
}
variable "public_subnet_a_availability_zone" {
    default = "ap-south-1a"
    type = string
    description = "az value"
}

variable "public_subnet_a_cidr" {
    default = "10.0.1.0/24"
    type = string
    description = "public-subnet_cidr"
  
}

variable "public_subnet_b_name" {
    default     = "sphere-ps-1b"
    type        = string
   description = "ps name"
  
}
variable "public_subnet_b_availability_zone" {
    default = "ap-south-1b"
    type = string
    description = "az value"
}

variable "public_subnet_b_cidr" {
    default = "10.0.2.0/24"
    type = string
    description = "public-subnet_cidr"
  
}

variable "private_subnet_a_name" {
    default     = "sphere-private-s-1"
    type        = string
   description = "ps name"
  
}
variable "private_subnet_a_availability_zone" {
    default = "ap-south-1a"
    type = string
    description = "az value"
}

variable "private_subnet_a_cidr" {
    default = "10.0.11.0/24"
    type = string
    description = "private-subnet_cidr"
  
}

variable "private_subnet_b_name" {
    default     = "sphere-private-s-1b"
    type        = string
   description = "ps name"
  
}
variable "private_subnet_b_availability_zone" {
    default = "ap-south-1b"
    type = string
    description = "az value"
}

variable "private_subnet_b_cidr" {
    default = "10.0.12.0/24"
    type = string
    description = "public-subnet_cidr"
  
}

variable "eip_name" {
    default = "eip-1"
    type = string
    description = "eip name"
  
}

variable "nat_name" {
    default = "nat-1"
    type = string
    description = "nat name"
  
}
variable "public_route_cidr" {
    default = "0.0.0.0/0"
    type = string
    description = "public_route_cidr"
  
}

variable "private_route_cidr" {
    default = "0.0.0.0/0"
    type = string
    description = "public_route_cidr"
  
}
