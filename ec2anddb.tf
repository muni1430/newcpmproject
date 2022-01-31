provider "aws" {
  region = "us-east-1"
}
resource "aws_instance" "myec2" {
  depends_on = [aws_db_instance.default]
  ami           = "ami-04505e74c0741db8d"
  instance_type = "t2.micro"
  subnet_id   = "subnet-03a83a9c26a79aeec"
  key_name = "newawskey"
  user_data = templatefile("${path.module}/userdata.tf", {endpoint = aws_db_instance.default.endpoint,password = aws_db_instance.default.password,address = aws_db_instance.default.address)
  iam_instance_profile = "demo_full_access"
  security_groups = ["sg-01361c1aff01f515a"]
  tags = {
    Name = "Ec2tf"
  }
}
resource "aws_db_instance" "default" {
  allocated_storage    = 10
  engine               = "mysql"
  engine_version       = "5.7"
  instance_class       = "db.t2.micro"
  name                 = "cpms"
  username             = "admin"
  password             = "muni1234"
  parameter_group_name = "default.mysql5.7"
  skip_final_snapshot  = true
  publicly_accessible  = true
  vpc_security_group_ids = ["sg-01361c1aff01f515a"]
}

}
