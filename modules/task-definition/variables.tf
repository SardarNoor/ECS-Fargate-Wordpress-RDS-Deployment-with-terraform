variable "db_host" {
  description = "RDS endpoint"
  type        = string
}

variable "db_name" {
  description = "Database name"
  type        = string
}

variable "db_user" {
  description = "Database user"
  type        = string
}

variable "db_password" {
  description = "Database password"
  type        = string
  sensitive   = true
}

variable "container_image" {
  description = "Docker image for WordPress"
  type        = string
}

variable "container_port" {
  description = "Container port"
  type        = number
}
variable "execution_role_arn" {
  description = "IAM role for ECS task execution"
  type        = string
}
