resource "aws_s3_bucket" "static_website" {
  bucket = "my-tf-test-bucfdhdgg"

}

resource "aws_s3_bucket_public_access_block" "disable_public" {
  bucket = aws_s3_bucket.static_website.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false

}

resource "aws_s3_bucket_policy" "public_read" {
  bucket = aws_s3_bucket.static_website.id

  policy = jsonencode({
    "Version" : "2012-10-17",
    "Id" : "MYBUCKETPOLICY",
    "Statement" : [
      {
        "Sid" : "IPAllow",
        "Effect" : "Allow",
        "Principal" : "*",
        "Action" : "s3:*",
        "Resource" : "${aws_s3_bucket.static_website.arn}/*"
      }
    ]
  })
}

resource "aws_s3_bucket_website_configuration" "example" {
  bucket = aws_s3_bucket.static_website.id

  index_document {
    suffix = "index.html"
  }

  error_document {
    key = "error.html"
  }

}

resource "aws_s3_object" "index_html" {
    bucket = aws_s3_bucket.static_website.id
    key="index.html"
    source="build/index.html"
    content_type = "text/html"
}

resource "aws_s3_object" "error_html" {
    bucket = aws_s3_bucket.static_website.id
    key="error.html"
    source="build/index.html"
    content_type = "text/html"
}