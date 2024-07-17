

//EC2 Instance Creation
resource "aws_instance" "sample_app_instance" {
  ami                    = var.ami_id
  instance_type          = "t2.micro"
  subnet_id              = aws_subnet.netspi_subnet.id
  security_groups        = [aws_security_group.ssh_access.name]
  key_name               = "Sample-Key"
  associate_public_ip_address = true
  iam_instance_profile   = aws_iam_instance_profile.ec2_instance_profile.name

  tags = {
    Name = "sample_app_instance"
  }

  user_data = <<-EOF
              #!/bin/bash
              yum install -y amazon-efs-utils
              mkdir -p ${var.efs_mount_folder}
              mount -t efs ${aws_efs_file_system.netspi_efs.id}:/ ${var.efs_mount_folder}
              EOF
}


# Assign Elastic IP to EC2 Instance
resource "aws_eip_association" "main" {
  instance_id   = aws_instance.sample_app_instance.id
  allocation_id = aws_eip.netspi_eip.id
}