resource "aws_iam_role" "s3_session_manager_role" {
  name               = "s3-session-manager-role"
  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "",
      "Effect": "Allow",
      "Principal": {
        "Service": "ec2.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
EOF
}

resource "aws_iam_policy" "s3_access_policy" {
  name        = "s3-access-policy"
  description = "Allows put/get access to S3 bucket"
  policy      = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "AllowS3Access",
      "Effect": "Allow",
      "Action": [
        "s3:PutObject",
        "s3:GetObject"
      ],
      "Resource": "arn:aws:s3:::my-s3-bucket.aws-terraform-practice-1"
    }
  ]
}
EOF
}

resource "aws_iam_policy_attachment" "s3_access_attachment" {
  name       = "s3-access-attachment"
  policy_arn = aws_iam_policy.s3_access_policy.arn
  roles      = [aws_iam_role.s3_session_manager_role.name]
}

resource "aws_iam_instance_profile" "s3_session_manager_instance_profile" {
  name = "s3-session-manager-instance-profile"
  role = aws_iam_role.s3_session_manager_role.name
}
