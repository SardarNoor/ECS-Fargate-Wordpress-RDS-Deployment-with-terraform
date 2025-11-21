resource "aws_db_instance" "mysql" {
  identifier           = "wordpress-mysql"
  engine               = "mysql"
  engine_version       = "8.0"
  instance_class       = var.db_instance_class
  allocated_storage    = 20

  db_name              = var.db_name
  username             = var.db_user
  password             = var.db_password

  publicly_accessible  = true   # training purpose only
  skip_final_snapshot  = true
  vpc_security_group_ids = [var.rds_sg_id]

  db_subnet_group_name = "wordpress-db-subnet-group"


  tags = {
    Name = "wordpress-mysql"
  }
}
