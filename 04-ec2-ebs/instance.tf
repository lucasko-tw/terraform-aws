resource "aws_volume_attachment" "my_ebs_att" {
  device_name = "/dev/sdh"
  volume_id   = "${aws_ebs_volume.my_ebs.id}"
  instance_id = "${aws_instance.my_ec2.id}"
  #  skip_destroy = true
}

resource "aws_instance" "my_ec2" {
  availability_zone = "eu-west-1a"
  ami           = "ami-09f0b8b3e41191524"
  instance_type = "t2.micro"
  key_name      = "lucasko"

  user_data = "#!/bin/bash\nmkdir /data; mount /dev/sdh /data;"
  # Attaching a volume is only visible to instance
  # You should mount it after launching a instance.
	
  root_block_device {
    volume_size = 8
    volume_type = "gp2"
  }

  ebs_block_device {
    device_name = "/dev/sdg"
    volume_size = 10
    volume_type = "gp2"
    delete_on_termination = false
    encrypted = true
  }


  tags = {
    Name = "HelloWorld" # EC2 Instance Name
  }
}

resource "aws_ebs_volume" "my_ebs" {
  availability_zone = "eu-west-1a"
  size              = 15
  
  tags = {
    Name = "My Extra Volume"  # Extra Volume Name
  }

}
