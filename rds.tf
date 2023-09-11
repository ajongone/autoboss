provider "aws" {
  region = "us-east-1"  # Change to your desired AWS region
}

resource "aws_db_instance" "example_db" {
  allocated_storage    = 20  # Change to your desired storage size (in GB)
  storage_type         = "gp2"  # Change to your desired storage type
  engine               = "mysql"  # Change to your desired database engine
  engine_version       = "5.7"  # Change to your desired database engine version
  instance_class       = "db.t2.micro"  # Change to your desired instance type
  name                 = "exampledb"  # Change to your desired database name
  username             = "dbusername"  # Change to your desired username
  password             = "dbpassword"  # Change to your desired password
  parameter_group_name = "default.mysql5.7"  # Change to your desired parameter group
  skip_final_snapshot  = true  # Change to false if you want a final snapshot when deleting the RDS instance
  tags = {
    Name = "example-db"
  }
}

output "rds_endpoint" {
  value = aws_db_instance.example_db.endpoint
}
