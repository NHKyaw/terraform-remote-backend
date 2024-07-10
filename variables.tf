variable "aws_region" {
  type    = string
  default = "ap-southeast-1"
}

variable "aws_profile" {
  description = "Your AWS profile name"
  type    = string
  default = "NHK_profile"
}

variable "NHK-S3-Name" {
  description = "Your AWS S3 bucket name"
  type    = string
  default = "nhk-s3-bucket"
}

variable "dynamodb-name" {
  type    = string
  default = "NHK-DB-TB"
}