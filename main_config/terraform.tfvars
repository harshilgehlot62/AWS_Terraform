# Below values are for general use for all resources 

name                        = "SRE-TEST"
region                      = "us-east-1"
ami                         = "ami-0ae8f15ae66fe8cda"
instance_type               = "t2.micro"
root_drive_size             = "30"
root_drive_type             = "gp3"
ebs_volume_size_1           = "10"
ebs_volume_size_2           = "15"
ebs_drive_type              = "gp3"    
iam_instance_profile        = "EC2-ssm-role"
kms_key_id                  = ""      
security_id                 = ["sg-000799734cbc6620c"]
subnet_id                   = ["subnet1","subnet2","subnet3"]
vpc_id                      = ""
tags = { Name = "SRE-TEST", Description = "Managed by Terraform"}

# for load balancer ...

alb_name  = "myalb" 
target_group_name = "mytg"
target_group_port = 80
listner_rules = ["site1.com","site2.com","site3.com","site4.com","site5.com","site6.com"]

max_capacity = 5


