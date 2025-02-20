variable "vpc_id" {
  description = "The ID of the VPC to associate with the ALB"
  type        = string
}

variable "public_subnets" {
  description = "The list of public subnets to associate with the ALB"
  type        = list(string)
}

variable "lb_security_group" {
  description = "The security group to associate with the ALB"
  type        = string
}

variable "health_check_path" {
  description = "The path for the ALB health check"
  type        = string
}

variable "app_port" {
  description = "The port on which the ALB listens for incoming requests"
  type        = number
  default     = 80
}

