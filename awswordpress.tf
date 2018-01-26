#Configure the AWS Provider
provider "aws" {
  access_key = "${var.access_key}"
  secret_key = "${var.secret_key}"
  region = "us-east-1"
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
  provisioner "remote-exec" {
    inline = [
      "sudo sed -i 's/mysql1.cz9tv4hdxksm.us-east-1.rds.amazonaws.com/${data.aws_db_instance.mysql_inst.endpoint}/' /var/www/html/wp-config.php",
      "sudo sed -i 's/:3306//' /var/www/html/wp-config.php",
#       "echo toto > /root/toto.txt",
    ]


  connection {
    type     = "ssh"
    user     = "ec2-user"
    private_key = "${file("/root/.ssh/inst")}"
    timeout = "10m"

  }
  
  }

  depends_on = ["aws_db_instance.default"]
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
