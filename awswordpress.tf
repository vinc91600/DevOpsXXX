#Configure the AWS Provider
provider "aws" {
  access_key = "${var.access_key}"
  secret_key = "${var.secret_key}"
  region = "us-east-1"
}

#Create a web server

resource "aws_instance" "WordPress3" {
  key_name = "KeyINSTA"
  security_groups = [
  "MyDMZ"
  ]
  ami = "ami-b9b784c3"
  instance_type = "t2.micro"
   tags {
    Name = "WP4"
  }
}
