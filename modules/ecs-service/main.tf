resource "aws_ecs_service" "wordpress_service" {
  name            = "wordpress-service"
  cluster         = var.cluster_name
  task_definition = var.task_definition_arn
  desired_count   = var.desired_count
  launch_type     = "FARGATE"

  network_configuration {
    subnets         = var.public_subnet_ids
    security_groups = [var.wordpress_sg_id]
    assign_public_ip = true
  }

  lifecycle {
    ignore_changes = [
      task_definition
    ]
  }

  depends_on = []
}
