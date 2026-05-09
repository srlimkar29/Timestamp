# Environment Variables
variable "region" {}
variable "project_name" {}
variable "environment" {}

# VPC Variables
variable "vpc_cidr" {}
variable "public_subnet_az1_cidr" {}
variable "public_subnet_az2_cidr" {}
variable "private_app_subnet_az1_cidr" {}
variable "private_app_subnet_az2_cidr" {}

# S3 Variables
variable "bucket_name" {}

# DynamoDB Variables
variable "table_name" {
  type    = string
  default = "DynamoDB-Timestamp"
}

variable "billing_mode" {
  type    = string
  default = "PROVISIONED"
}

variable "read_capacity" {
  type    = number
  default = 10
}

variable "write_capacity" {
  type    = number
  default = 10
}

variable "first_attribute" {
  type    = string
  default = "ID"
}

variable "second_attribute" {
  type    = string
  default = "Time"
}
