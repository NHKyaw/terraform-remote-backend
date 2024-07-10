resource "aws_s3_bucket" "NHK-S3" {
  bucket = var.NHK-S3-Name
}

resource "aws_s3_bucket_ownership_controls" "NHK-S3-Own" {
  bucket = aws_s3_bucket.NHK-S3.id

  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}

resource "aws_s3_bucket_acl" "NHK-S3-ACL" {
  depends_on = [aws_s3_bucket_ownership_controls.NHK-S3-Own]

  bucket = aws_s3_bucket.NHK-S3.id
  acl    = "private"
}

resource "aws_s3_bucket_versioning" "NHK-S3-Version" {
  bucket = aws_s3_bucket.NHK-S3.id
  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_server_side_encryption_configuration" "example" {
  bucket = aws_s3_bucket.NHK-S3.id

  rule {
    apply_server_side_encryption_by_default {
    #   kms_master_key_id = aws_kms_key.mykey.arn
      sse_algorithm     = "AES256"
    }
  }
}

resource "aws_dynamodb_table" "NHK-dynamo-table" {
  name           = var.dynamodb-name
  billing_mode   = "PAY_PER_REQUEST"
  hash_key       = "LOCKID"

  attribute {
    name = "LOCKID"
    type = "S"
  }
}