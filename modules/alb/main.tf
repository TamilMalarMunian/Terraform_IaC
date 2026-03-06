resource "aws_lb" "app_lb" {
  name               = "terraform-alb"
  internal           = false
  load_balancer_type = "application"
  subnets            = [var.public_subnet_1, var.public_subnet_2]
}