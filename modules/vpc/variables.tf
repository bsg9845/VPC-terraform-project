variable "vpc_cidr" {
  description = "VPC CIDR RANGE"
  type = string
}

variable "subnet_cidr" {
  description = "Subnet CIDR Range"
  type = list(string)
}

variable "subnet_names" {
  description = "subnet names"
  type = list(string)
  default = [ "publicsubnet1","publicsubnet2" ]
}