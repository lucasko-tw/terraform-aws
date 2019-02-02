resource "aws_ebs_volume" "example" {
  availability_zone = "eu-west-1a"
  size              = 20

  encrypted = true

  type              = "gp2"
  # gp2 : General purpose SSD volume that balances price and performance
  # io1 : Highest-performance SSD volume for mission-critical low-latency
  # st1 : Low-cost HDD volume designed for frequently accessed
  # sc1 : Lowest cost HDD volume designed for less frequently accessed 
  
   
  tags = {
    Name = "HelloWorld"  # Volume Name
  }
}
