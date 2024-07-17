variable "region" {
  default = "us-west-2"
  description = "AWS region where deployment should happen"
  nullable = false
}

variable "access_key" {
  default = "xx"
  description = "AWS account access key"
  sensitive = true
  nullable = false
}

variable "secret_key" {
  default = "xx"
  description = "AWS account secret key"
  sensitive = true
  nullable = false
}

variable "role_arn" {
  default = "xx"
  description = "Role to be assumed which is having permissions to create resources"
  sensitive = true
  nullable = false
}

variable "s3_bucket_name" {
  default = "netspi-bucket"
  description = "Name of Test S3 Bucket"
}

variable "vpc_cidr" {
  description = "VPC CIDR Block for IP address spaces"
  default = "10.0.0.0/16"
}

variable "subnet_cidr" {
  description = "subnet CIDR Block for IP address spaces"
  default = "10.0.1.0/24"
}
