variable "region" {
  description = "AWS region for resources"
  type        = string
  default     = "us-east-1"
}

variable "bucket_name" {
  description = "The S3 bucket name for Terraform state storage"
  type        = string
}

variable "dynamodb_table" {
  description = "DynamoDB table for Terraform state locking"
  type        = string
}
