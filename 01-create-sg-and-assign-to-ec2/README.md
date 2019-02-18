# terraform-aws

### Create a Security & Assign to EC2

```sh
data "aws_vpc" "default" {
  default = true
}

resource "aws_security_group" "my-sg" {

  name        = "allow_inbound"
  description = "Allow all inbound traffic"
  vpc_id      = "${data.aws_vpc.default.id}"

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

ami = "ami-09f0b8b3e41191524"
instance_type="t2.micro"
key_name = "lucasko"

vpc_security_group_ids = ["${aws_security_group.my-sg.id}"]

// security_groups = ["my-tag"] 
}


```


