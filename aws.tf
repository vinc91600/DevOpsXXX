# Configure the AWS Provider
provider "aws" {
  access_key = "$access_key"
  secret_key = "$secret_key"
  region     = "us-east-1"
}

# Create a web server

resource "aws_instance" "testweb" {
  key_name      = "KeyINSTA"
  security_groups = [
  "MyDMZ"
  ]
  ami   = "ami-97785bed"
  instance_type = "t2.micro"
}
