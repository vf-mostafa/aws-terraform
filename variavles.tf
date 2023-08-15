variable "bucket_name" {
  description = "name of s3 bucket"
  type        = string
  default     = "my-s3-bucket.aws-terraform-practice-1"
}
variable "instance_name" {
  description = "this is to set instance name with variable"
  type        = string
  default     = "ansible"
}
