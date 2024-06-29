resource "aws_s3_bucket" "this" {
  bucket = var.bucket_name

  website {
    index_document = var.index_document
    error_document = var.error_document
  }

  policy = data.aws_iam_policy_document.bucket_policy.json
}

data "aws_iam_policy_document" "bucket_policy" {
  statement {
    actions   = ["s3:GetObject"]
    resources = ["${aws_s3_bucket.this.arn}/*"]
    principals {
      type        = "AWS"
      identifiers = ["*"]
    }
  }
}

resource "aws_s3_bucket_object" "website_files" {
  for_each = fileset(var.website_content_dir, "**")

  bucket = aws_s3_bucket.this.bucket
  key    = each.value
  source = "${var.website_content_dir}/${each.value}"
  etag   = filemd5("${var.website_content_dir}/${each.value}")

  acl = "public-read"
}
