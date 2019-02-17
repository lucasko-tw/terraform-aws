resource "aws_vpc" "foo" {
  enable_dns_hostnames = true
  cidr_block = "10.0.0.0/16"
}

resource "aws_subnet" "alpha" {
  vpc_id            = "${aws_vpc.foo.id}"
  availability_zone = "eu-west-1a"
  cidr_block        = "10.0.1.0/24"
  
  map_public_ip_on_launch = true

}



resource "aws_internet_gateway" "gw" {
  vpc_id = "${aws_vpc.foo.id}"

  tags = {
    Name = "foo"
  }
}

resource "aws_route_table" "eu-west-1a-public" {
    vpc_id = "${aws_vpc.foo.id}"

    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = "${aws_internet_gateway.gw.id}"
    }

    tags {
        Name = "Public Subnet"
    }
}


resource "aws_route_table_association" "eu-west-1a-public" {
    subnet_id = "${aws_subnet.alpha.id}"
    route_table_id = "${aws_route_table.eu-west-1a-public.id}"
}

