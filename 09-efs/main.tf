
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

    inline = [
      "sudo yum update -y ",
      "sudo yum install -y nfs-utils",
      "sudo mkdir /efs",
      "sudo chown -R centos:centos /efs",
      "sudo mount -t nfs4 -o nfsvers=4.1,rsize=1048576,wsize=1048576,hard,timeo=600,retrans=2 ${aws_efs_file_system.foo.dns_name}:/ /efs",
    ]
    
  }



}

