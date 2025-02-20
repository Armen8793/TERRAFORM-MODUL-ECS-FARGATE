resource "aws_ecs_cluster" "main" {
  name = "bdg-cluster"
}

resource "aws_ecs_task_definition" "app" {
  family                   = "myapp-task"
  execution_role_arn = var.execution_role_arn
  network_mode             = "awsvpc"
  requires_compatibilities = ["FARGATE"]
  cpu                      = var.fargate_cpu
  memory                   = var.fargate_memory
  container_definitions    = var.container_definitions
}

resource "aws_ecs_service" "main" {
  name            = "myapp-service"
  cluster         = aws_ecs_cluster.main.id
  task_definition = aws_ecs_task_definition.app.arn
  desired_count   = var.app_count
  launch_type     = "FARGATE"

  network_configuration {
    security_groups  = [var.security_group_id]
    subnets          = var.private_subnet_ids
    assign_public_ip = false
  }

  load_balancer {
    target_group_arn = var.alb_target_group_arn 
    container_name   = "mangoost-bdg"
    container_port   = var.app_port
  }

  depends_on = [var.alb_listener_arn, var.iam_role_policy_attachment_arn]
}
