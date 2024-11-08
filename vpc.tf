resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "${local.name}-main"
  }

}


resource "aws_subnet" "main" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "10.0.1.0/24"
  availability_zone="ap-south-1a"

  tags = {
    Name = "${local.name}-subnet"
  }
}

resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "${local.name}-igw"
  }
}

resource "aws_route_table" "public-rt" {

  vpc_id = aws_vpc.main.id
  tags = {
    Name = "public-rt"
  }

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }

}

resource "aws_route_table_association" "public-subnet-asso" {
  subnet_id      = aws_subnet.main.id
  route_table_id = aws_route_table.public-rt.id
}

resource "aws_security_group" "allow_tls" {
  name        = "allow_tls"
  description = "Allow TLS inbound traffic and all outbound traffic"
  vpc_id      = aws_vpc.main.id

  tags = {
    Name = "allow_tls"
  }
}
resource "aws_vpc_security_group_ingress_rule" "allow_tls_ipv4" {
  security_group_id = aws_security_group.allow_tls.id
  cidr_ipv4         = aws_vpc.main.cidr_block
  from_port         = 443
  ip_protocol       = "tcp"
  to_port           = 443
}

resource "aws_vpc_security_group_ingress_rule" "allow_port_eighty" {
  security_group_id = aws_security_group.allow_tls.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 80
  ip_protocol       = "tcp"
  to_port           = 80
}



resource "aws_instance" "test" {
  ami             = "ami-0a700fe3132430839"
  associate_public_ip_address = true
  subnet_id       = aws_subnet.main.id
  vpc_security_group_ids = [aws_security_group.allow_tls.id]
  instance_type   = "t2.micro"
  tags = {
    Name = "test-server"
  }
}
