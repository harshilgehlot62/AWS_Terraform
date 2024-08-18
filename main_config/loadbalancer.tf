module "alb" {
  source = "../modules/alb"
  depends_on = [module.ec2_instance]

  alb_name          = var.alb_name        # Name of the ALB
  security_id       = var.security_id     # List of security groups for the ALB
  subnet_id         = var.subnet_id             # List of subnets for the ALB
  target_group_name = var.target_group_name     # Name of the Target group
  instance_id = module.ec2_instance.instance_id   # Get instance Id from outputs.tf
  tags = var.tags                                 # tags defined in tfvars
  listner_rules = var.listner_rules               # Listenar rules for ALB

  target_group_port = var.target_group_port       # Port for the target group
  vpc_id            = var.vpc_id                  # VPC ID
}
