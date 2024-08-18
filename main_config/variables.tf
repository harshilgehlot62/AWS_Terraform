variable "name" {
  type        = string
  description = "Name in AWS"
}

variable "region" {
  type        = string
  description = "The AWS Region"
}

variable "iam_instance_profile" {
	type        = string
	description = "Iam role to attach with the ec2"
}

variable "ami" {
  type        = string
  description = "Amazon Machine Image(AMI)"
}

variable "instance_type" {
  type        = string
  description = "Instance type"
}

variable "security_id" {
  #default     = []
  type        = list(string)
  description = "Security group ID"
}

variable "subnet_id" {
  type        = list(string)
  description = "Subnet ID"
}

variable "kms_key_id" {
  type        = string
  description = "KMS Key ARN"
}

variable "tags" {
  type        = map(any)
  description = "Product tag"
}

variable "root_drive_type" {
  type        = string
  description = "Type of the sotrage class for the root ebs"
}

variable "root_drive_size" {
  type        = number
  description = "Size of the root ebs volume"
}

variable "ebs_drive_type" {
  type        = string
  description = "Type of the sotrage class for the root ebs"
}

variable "ebs_volume_size_1" {
  type = string
  description = "Type of the storage class for ebs volume 1"
}

variable "ebs_volume_size_2" {
  type = string
  description = "Type of the storage class for ebs volume 2"
}

variable "vpc_id" {
  type = string
}

variable "alb_name" {
  type = string  
}

variable "target_group_name" {
  type = string
  description = "target group name"
}

variable "target_group_port" {
  type = number
  description = "target group port"
}

variable "listner_rules" {
  type =  list(string)
  description = "listner rules for alb"
}

variable "max_capacity" {
  type    = number
  default = 5
}
