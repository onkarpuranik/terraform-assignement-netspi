// VPC creation for CIDR range
resource "aws_vpc" "netspi_vpc" {
  cidr_block = var.vpc_cidr
  tags = {
    Name = "Default_VPC"
  }
}

// Subnet for some of the CIDR blocks from VPC
resource "aws_subnet" "netspi_subnet" {
  vpc_id     = aws_vpc.netspi_vpc.id
  cidr_block = var.subnet_cidr

  tags = {
    Name = "Default_Subnet"
  }
}

// Internet Gateway to connect to internet from VPC
resource "aws_internet_gateway" "netspi_igw" {
  vpc_id = aws_vpc.netspi_vpc.id

  tags = {
    Name = "Default_IGW"
  }
}

// Route Table
resource "aws_route_table" "netspi_route_table" {
  vpc_id = aws_vpc.netspi_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.netspi_igw.id
  }

  tags = {
    Name = "netspi_route_table"
  }
}

// Route Table Association
resource "aws_route_table_association" "route_table_association" {
  subnet_id      = aws_subnet.netspi_subnet.id
  route_table_id = aws_route_table.netspi_route_table.id
}

// Security Group
resource "aws_security_group" "ssh_access" {
  vpc_id = aws_vpc.netspi_vpc.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "ssh_access_sg"
  }
}
