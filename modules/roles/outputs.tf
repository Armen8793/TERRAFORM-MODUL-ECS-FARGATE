output "ecs_task_execution_role_arn" {
  value = aws_iam_role.ecs_task_execution_role.arn
}

output "ecs_task_execution_role_name" {
  value = aws_iam_role.ecs_task_execution_role.name
}

output "iam_role_policy_attachment_arn" {
  value = aws_iam_role_policy_attachment.ecs_task_execution_role.id
}

