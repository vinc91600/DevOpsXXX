#Configure the AWS Provider
provider "aws" {
  access_key = "${var.access_key}"
  secret_key = "${var.secret_key}"
  region = "us-east-1c"
}

#Create a web server

resource "aws_instance" "WordPress5" {
  key_name = "KeyINSTA"
  security_groups = [
  "MyDMZ"
  ]
  ami = "ami-6196a51b"
  instance_type = "t2.micro"
   tags {
    Name = "WP5"
  }
}

resource "aws_instance" "WordPress6" {
  key_name = "KeyINSTA"
  security_groups = [
  "MyDMZ"
  ]
  ami = "ami-6196a51b"
  instance_type = "t2.micro"
   tags {
    Name = "WP6"
  }
}