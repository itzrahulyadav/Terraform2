

removed {
    from = aws_s3_bucket.my_bucket

    lifecycle {
      destroy = false
    }
}


resource "aws_s3_bucket" "s3" {
    bucket = "myfdhkdb"
}