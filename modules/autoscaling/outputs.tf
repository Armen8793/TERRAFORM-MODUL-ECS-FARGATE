output "autoscaling_target_id" {
  value = aws_appautoscaling_target.target.id
}

output "autoscaling_policy_up_id" {
  value = aws_appautoscaling_policy.up.id
}

output "autoscaling_policy_down_id" {
  value = aws_appautoscaling_policy.down.id
}

