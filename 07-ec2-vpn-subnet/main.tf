
resource "aws_security_group" "my-sg" {

  name        = "allow_inbound"
  description = "Allow all inbound traffic"
  vpc_id      = "${aws_vpc.foo.id}"

  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }


 tags = {
    Name = "my-tag" 
  }
}

resource "aws_instance" "my_instance"
{

  ami = "ami-0d063c6b"
  instance_type="t2.micro"
  key_name = "lucasko"

  vpc_security_group_ids = ["${aws_security_group.my-sg.id}"]
  subnet_id = "${aws_subnet.alpha.id}"
  provisioner "remote-exec" {
    connection {
      type     = "ssh"
      user     = "centos"
      private_key = "${file("~/Downloads/lucasko.pem")}"
    } 

    
  }



}

