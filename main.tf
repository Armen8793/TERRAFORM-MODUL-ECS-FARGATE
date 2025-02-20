resource "aws_ecs_cluster" "main" {
  name = "bdg-cluster"
}

data "template_file" "myapp" {
  template = file("./templates/ecs/myapp.json.tpl")

  vars = {
    app_image      = var.app_image
    app_port       = var.app_port
    fargate_cpu    = var.fargate_cpu
    fargate_memory = var.fargate_memory
    aws_region     = var.aws_region
  }
}


module "roles" {
  source = "./modules/roles"
}

module "network" {
  source = "./modules/network"
}

module "alb" {
  source = "./modules/alb"

  vpc_id            = module.network.vpc_id             
  public_subnets    = module.network.public_subnet_ids  
  lb_security_group = module.security_group.ecs_security_group_id
  health_check_path = "/health"
}

module "security_group" {
  source = "./modules/security_group"
  vpc_id = module.network.vpc_id  
}

module "ecs" {
  source                = "./modules/ecs"
  container_definitions = data.template_file.myapp.rendered
  execution_role_arn    = module.roles.ecs_task_execution_role_arn
  security_group_id     = module.security_group.ecs_security_group_id
  iam_role_policy_attachment_arn   = module.roles.iam_role_policy_attachment_arn
  private_subnet_ids    = module.network.private_subnet_ids
  alb_target_group_arn  = module.alb.target_group_arn
  alb_listener_arn      = module.alb.lb_listener_arn
}


