# Create a new load balancer
resource "aws_elb" "wpbal" {
  name               = "wpbal"
  availability_zones = ["us-east-1a", "us-east-1b", "us-east-1c", "us-east-1d", "us-east-1e", "us-east-1f"]

  
  listener {
    instance_port     = 80
    instance_protocol = "http"
    lb_port           = 80
    lb_protocol       = "http"
  }


  health_check {
    healthy_threshold   = 2
    unhealthy_threshold = 2
    timeout             = 3
    target              = "HTTP:80/test.html"
    interval            = 30
  }

  instances                   = ["${aws_instance.WordPress6.id}","${aws_instance.WordPress5.id}"]
  cross_zone_load_balancing   = true
  idle_timeout                = 400
  connection_draining         = true
  connection_draining_timeout = 400

  tags {
    Name = "wpbal"
  }
depends_on = ["aws_instance.WordPress6"]
depends_on = ["aws_instance.WordPress5"]
}
