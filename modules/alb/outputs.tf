output "lb_id" {
  value = aws_lb.main.id
}

output "target_group_id" {
  value = aws_lb_target_group.app.id
}

output "lb_listener_arn" {
  value = aws_lb_listener.front_end.arn
}

output "target_group_arn" {
  value = aws_lb_target_group.app.arn
}
