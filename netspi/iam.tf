
//Instance Profile Role for ec2 interaction
resource "aws_iam_role" "ec2_role" {
  name = "ec2_role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Action = "sts:AssumeRole",
        Effect = "Allow",
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      }
    ]
  })
}

//Permissions and Policy
resource "aws_iam_policy" "ec2_policy" {
  name        = "ec2_policy"
  description = "Policy for EC2 instance to access EFS"
  policy      = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Action = [
          "elasticfilesystem:DescribeFileSystems",
          "elasticfilesystem:DescribeMountTargets",
          "elasticfilesystem:DescribeMountTargetSecurityGroups",
          "elasticfilesystem:DescribeTags"
        ],
        Effect   = "Allow",
        Resource = "*"
      }
    ]
  })
}

//Attaching Policy to Instance Profile Role
resource "aws_iam_role_policy_attachment" "attach_ec2_policy" {
  role       = aws_iam_role.ec2_role.name
  policy_arn = aws_iam_policy.ec2_policy.arn
}

//Instance Profile Creation
resource "aws_iam_instance_profile" "ec2_instance_profile" {
  name = "ec2_instance_profile"
  role = aws_iam_role.ec2_role.name
}

