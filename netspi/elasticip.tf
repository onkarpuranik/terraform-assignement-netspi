
resource "aws_eip" "netspi_eip" {
  vpc = true
  tags = {
    Project = "NetSPI_EIP"
  }
}

