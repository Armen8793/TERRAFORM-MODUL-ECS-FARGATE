output "lb_security_group_id" {
  value = aws_security_group.lb.id
}

output "alb_security_group_id" {
  value = aws_security_group.lb.id
}

output "ecs_security_group_id" {
  value = aws_security_group.ecs_tasks.id
}


output "ecs_tasks_security_group_id" {
  value = aws_security_group.ecs_tasks.id
}

