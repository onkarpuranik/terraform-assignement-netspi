output "aws_eip_ip" {
  description = "Elastic or static ip "
  value = aws_eip.netspi_eip.public_ip
}

output "s3_bucket_id" {
  description = " S3 bucket ID "
  value = aws_s3_bucket.netspi_s3_bucket.id
}

output "vpc_id" {
  description = " VPC ID "
  value = aws_vpc.netspi_vpc.id
}

output "subnet_id" {
  description = " Subnet ID "
  value = aws_subnet.netspi_subnet.id
}

output "security_group_id" {
  description = " Security Group ID "
  value = aws_security_group.ssh_access.id
}

output "efs_volume_id" {
  description = " EFS Volume ID "
  value = aws_efs_file_system.netspi_efs.id
}


output "ec2_instance_id" {
  description = " EC2 Instance ID "
  value = aws_instance.sample_app_instance.id
}
