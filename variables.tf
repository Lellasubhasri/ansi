variable "aws_region" {
  description = "resources will deploy here"
  type        = string
}

variable "vpc_name" {
  description = "vpc"
}
variable "vpc_cidr" {
  description = "this is cidr address"

}

variable "cidr_public" {
  description = "this is for CIDR public subnet"
}

variable "cidr_private" {
  description = "this is for CIDR private subnet"
}