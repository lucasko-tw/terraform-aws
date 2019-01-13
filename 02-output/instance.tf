data "aws_vpc" "default" {
  default = true
}

resource "aws_instance" "my_instance" {
  ami           = "ami-09f0b8b3e41191524"
  instance_type = "t2.micro"

  provisioner "local-exec" {
    command = "echo ${aws_instance.my_instance.private_ip} >> private_ips.txt"
  }
}

output "ip" {
  value = "${aws_instance.my_instance.public_ip}"
}
