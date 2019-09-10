resource "aws_vpc" "environment-example" {
  cidr_block ="10.0.0.0/16"
  enable_dns_hostnames = true
  enable_dns_support = true
  tags ={
    Name = "terraform-aws-vpc-example"
  }
}

resource "aws_subnet" "subnet1" {
  cidr_block = "${cidrsubnet(aws_vpc.environment-example.cidr_block, 3, 1)}"
  vpc_id = "${aws_vpc.environment-example.id}"
  availability_zone = "us-east-2a"
}

resource "aws_subnet" "subnet2" {
  cidr_block = "${cidrsubnet(aws_vpc.environment-example.cidr_block, 2, 2)}"
  vpc_id = "${aws_vpc.environment-example.id}"
  availability_zone = "us-east-2b"
}

resource "aws_security_group" "subnetsecurity" {
  vpc_id = "${aws_vpc.environment-example.id}"

  ingress {
    cidr_blocks = [
      "${aws_vpc.environment-example.cidr_block}"
    ]

    from_port = 80
    to_port = 80
    protocol = "tcp"
  }
}
