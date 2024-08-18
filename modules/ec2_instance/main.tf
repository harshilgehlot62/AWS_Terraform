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
  type        = string
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

variable "vpc_id" {
  type = string
}

variable "ebs_volume_size_1" {
  type = string
  description = "Type of the storage class for ebs volume 1"
}

variable "ebs_volume_size_2" {
  type = string
  description = "Type of the storage class for ebs volume 2"

}

resource "aws_instance" "example" {
  ami           = var.ami
  instance_type = var.instance_type
  subnet_id     = var.subnet_id
  tags = var.tags
  iam_instance_profile = var.iam_instance_profile
  vpc_security_group_ids = var.security_id

  root_block_device {
    volume_type = var.root_drive_type
    volume_size = var.root_drive_size
  }
  
   ebs_block_device {
    device_name = "/dev/sdb"  # Adjust the device name as necessary
    volume_type = var.root_drive_type
    volume_size = var.ebs_volume_size_1
    delete_on_termination = true
  }

   ebs_block_device {
    device_name = "/dev/sdc"  # Adjust the device name as necessary
    volume_type = var.root_drive_type
    volume_size = var.ebs_volume_size_2
    delete_on_termination = true
  }


  
}