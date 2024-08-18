module "ec2_instance" {
  source                 = "../modules/ec2_instance"
name = var.name
region = var.region
iam_instance_profile = var.iam_instance_profile
ami = var.ami
instance_type = var.instance_type
security_id = var.security_id
subnet_id = var.subnet_id[0]
kms_key_id = var.kms_key_id
tags = var.tags
root_drive_type = var.root_drive_type
root_drive_size = var.root_drive_size
ebs_volume_size_1 = var.ebs_volume_size_1 
ebs_volume_size_2 = var.ebs_volume_size_2
ebs_drive_type = var.ebs_drive_type
vpc_id = var.vpc_id
}