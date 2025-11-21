resource "aws_ecs_cluster" "this" {
  name = "wordpress-ecs-cluster"

  tags = {
    Name = "wordpress-ecs-cluster"
  }
}
