variable "aws_region" {
  type    = string
  default = "us-east-1"
}

variable "student_id" {
  type = string
}

variable "cluster_name" {
  type    = string
  default = "project-bedrock-cluster"
}

variable "vpc_name" {
  type    = string
  default = "project-bedrock-vpc"
}

variable "kubernetes_version" {
  type    = string
  default = "1.34"
}