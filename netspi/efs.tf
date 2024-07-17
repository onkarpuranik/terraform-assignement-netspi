# EFS File System
resource "aws_efs_file_system" "netspi_efs" {
  encrypted = true
  creation_token = "netspi_create_token"
  performance_mode = "generalPurpose"
  tags = {
    Name = "netspi_efs"
  }
}


# EFS Mount Target
resource "aws_efs_mount_target" "mount_target" {

  depends_on = [aws_subnet.netspi_subnet, aws_security_group.ssh_access]

  file_system_id = aws_efs_file_system.netspi_efs.id
  subnet_id      = aws_subnet.netspi_subnet.id

  security_groups = [aws_security_group.ssh_access.id]

}