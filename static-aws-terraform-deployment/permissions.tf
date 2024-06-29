resource "aws_iam_role" "cloudfront_logging_role" {
  name = "cloudfront-logging-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect = "Allow",
        Principal = {
          Service = "cloudfront.amazonaws.com"
        },
        Action = "sts:AssumeRole"
      }
    ]
  })
}

resource "aws_iam_policy" "cloudfront_logging_policy" {
  name        = "cloudfront-logging-policy"
  description = "A policy to allow CloudFront to write logs to an S3 bucket"

  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect   = "Allow",
        Action   = "s3:PutObject",
        Resource = "${module.s3_bucket.bucket_arn}/*"
      }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "cloudfront_logging_attachment" {
  role       = aws_iam_role.cloudfront_logging_role.name
  policy_arn = aws_iam_policy.cloudfront_logging_policy.arn
}
