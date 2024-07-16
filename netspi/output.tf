output "aws_eip_ip" {
  description = "Elastic or static ip inside the VPC"
  value = aws_eip.netspi_eip.public_ip
}

output "s3_bucket_id" {
  description = " S3 bucket ID "
  value = aws_s3_bucket.netspi_s3_bucket.id
}