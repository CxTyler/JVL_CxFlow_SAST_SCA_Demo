resource "aws_s3_bucket" "b" {
  bucket = "S3B_541"
  acl    = "public-read"
  
  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        kms_master_key_id = "${aws_kms_key.mykey.arn}"
        sse_algorithm     = "aws:kms"
      }
    }
  }

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}
