variable "environment" {
  type        = string
  description = "Tooling cluster environment"
  default     = "dev"
}

variable "target_iam_account" {
  type        = map(any)
  description = "Deploy role."
}

variable "dns_account_deploy_role" {
  type        = map(any)
  description = "Deploy role of dns account."
}

variable "cluster_name" {
  type        = map(any)
  description = "Account number for route53 dns."
}

variable "engineering_domain" {
  type        = map(any)
  description = "engineering route53 domain."
}

variable "dns_manager_role" {
  type    = string
  default = "engineering-dns-manager"
}

variable "cert_manager_role" {
  type = map(string)
  #default = "eksctl-cert-manager-role"
}

variable "admin_list" {
  type = map(string)
}

variable "ec2_read_role_name" {
  type    = string
  default = "ec2-read-role"
}

variable "ec2_read_iam_policy_name" {
  type    = string
  default = "ec2-describe-instances-policy"
}

variable "aws_account_secure_development" {
  type    = string
  default = ""
}

variable "tag_environment" {
  type        = map(string)
  description = "Tag Environment"
}
variable "s3_bucket_name" {
  type = map(string)
}


variable "kinesis_firehose_delivery_stream" {
  type = map(string)
}

variable "firehose_role" {
  type = map(string)
}