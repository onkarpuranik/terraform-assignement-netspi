//S3 Bucket Creation
resource "aws_s3_bucket" "netspi_s3_bucket" {
  bucket = var.s3_bucket_name

  tags = {
    Name        = var.s3_bucket_name
    Environment = "Dev"
    Owner = "ABC Team"
  }

}

//Blocking Public Access
resource "aws_s3_bucket_public_access_block" "block_public_access" {
  bucket = aws_s3_bucket.netspi_s3_bucket.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

//Bucket policy for role based or user based accesses . Here user based access for user onkar puranik
resource "aws_s3_bucket_policy" "allow_access_from_another_account" {
  bucket = aws_s3_bucket.netspi_s3_bucket.id
  policy = data.aws_iam_policy_document.policy_document.json
}

// Policy Document
data "aws_iam_policy_document" "policy_document" {
  statement {
    principals {
      type        = "AWS"
      identifiers = ["arn:aws:iam::123454321:user/onkar.puranik"]
    }

    actions = [
      "s3:GetObject",
      "s3:ListBucket",
    ]

    resources = [
      aws_s3_bucket.netspi_s3_bucket.arn,
      "${aws_s3_bucket.netspi_s3_bucket.arn}/*",
    ]
  }
}
