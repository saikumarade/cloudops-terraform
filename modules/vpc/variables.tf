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