variable "subnet_id" {
  type        = list(string)
  description = "Subnet ID"
}

variable "alb_name" {
  description = "Name of the ALB"
  type        = string
}

variable "security_id" {
  #default     = []
  type        = list(string)
  description = "Security group ID"
}

variable "target_group_name" {
  type = string
  description = "target group name"
}

variable "target_group_port" {
   type = number
   description = "target port value"

}

variable "vpc_id" {
  type = string
}

variable "instance_id" {
  description = "The ID of the EC2 instance"
  type        = string
}

variable "tags" {
  type        = map(any)
  description = "Product tag"
}

variable "listner_rules" {
  type =  list(string)
  description = "listner rules for alb"
}

variable "max_capacity" {
  type    = number
  default = 5
}


resource "aws_lb" "this" {
  name               = var.alb_name
  internal           = false
  load_balancer_type = "application"
  security_groups    = var.security_id 
  subnets             = var.subnet_id
  ip_address_type    = "ipv4"
}

resource "aws_lb_listener" "http_listener" {
  load_balancer_arn = aws_lb.this.arn
  port              = 80
  protocol          = "HTTP"
  #ssl_policy        = "ELBSecurityPolicy-2016-08"
  #certificate_arn   = var.certificate_arn

  default_action {
    type             = "fixed-response"
    fixed_response {
      content_type = "text/plain"
      message_body = "Not Found"
      status_code  = "404"
    }
  
  }
}

resource "aws_lb_listener_rule" "rule" {
  count = ceil(length(var.listner_rules) / var.max_capacity)
  listener_arn = aws_lb_listener.http_listener.arn
  priority     = 1 + count.index
  tags = var.tags

  condition {
    host_header {
      values = slice(
        var.listner_rules,
        count.index * var.max_capacity,
        min((count.index + 1) * var.max_capacity, length(var.listner_rules))
      )
    }
  }
  action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.main.arn
  }
}

resource "aws_lb_target_group" "main" {
  name     = var.target_group_name
  port     = var.target_group_port
  protocol = "HTTP"
  vpc_id   = var.vpc_id

  health_check {
    enabled             = true
    interval            = 30
    path                = "/"
    protocol            = "HTTP"
    timeout             = 5
    healthy_threshold   = 3
    unhealthy_threshold = 3
  }

  target_type = "instance"

}

resource "aws_lb_target_group_attachment" "main" {
  target_group_arn = aws_lb_target_group.main.arn
  target_id        = var.instance_id
  port             = var.target_group_port
}
