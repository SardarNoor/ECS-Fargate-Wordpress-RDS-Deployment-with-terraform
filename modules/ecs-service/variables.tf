variable "cluster_name" {
  description = "ECS Cluster Name"
  type        = string
}

variable "task_definition_arn" {
  description = "Task Definition ARN"
  type        = string
}

variable "public_subnet_ids" {
  description = "Public subnets for Fargate service"
  type        = list(string)
}

variable "wordpress_sg_id" {
  description = "Security group for WordPress service"
  type        = string
}

variable "desired_count" {
  description = "Number of tasks to run"
  type        = number
}
