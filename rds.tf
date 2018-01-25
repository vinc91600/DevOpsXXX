##RDS

resource "aws_db_instance" "default" {
  allocated_storage    = 20
  storage_type         = "gp2"
  engine               = "mysql"
  engine_version       = "5.6.37"
  instance_class       = "db.t2.micro"
  name                 = "wpdb"
  username             = "wpdb"
  password             = "password"
  db_subnet_group_name = "default"
  parameter_group_name = "default.mysql5.6"
}
