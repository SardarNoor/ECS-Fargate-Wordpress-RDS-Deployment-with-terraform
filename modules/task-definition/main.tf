resource "aws_ecs_task_definition" "wordpress" {
    execution_role_arn = var.execution_role_arn

  family                   = "wordpress-task"
  requires_compatibilities = ["FARGATE"]
  network_mode             = "awsvpc"
  cpu                      = "512"
  memory                   = "1024"

  container_definitions = jsonencode([
    {
      name      = "wordpress"
      image     = var.container_image
      essential = true

      portMappings = [
        {
          containerPort = var.container_port
          hostPort      = var.container_port
          protocol      = "tcp"
        }
      ]

      environment = [
        { name = "WORDPRESS_DB_HOST",     value = var.db_host },
        { name = "WORDPRESS_DB_NAME",     value = var.db_name },
        { name = "WORDPRESS_DB_USER",     value = var.db_user },
        { name = "WORDPRESS_DB_PASSWORD", value = var.db_password }
      ]
    }
  ])
}
