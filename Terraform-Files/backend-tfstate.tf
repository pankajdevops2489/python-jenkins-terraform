resource "aws_kms_key" "state_s3_key" {
  description             = "This key is used to encrypt bucket objects"
  deletion_window_in_days = 10
}

resource "aws_s3_bucket" "s3_bucket" {
  bucket = "state-file-s3-queen-python-app"
  acl    = "private" 
  versioning {
    enabled = true
  }
}

resource "aws_s3_bucket_server_side_encryption_configuration" "s3_kms" {
  bucket = aws_s3_bucket.s3_bucket.id

  rule {
    apply_server_side_encryption_by_default {
      kms_master_key_id = aws_kms_key.state_s3_key.arn
      sse_algorithm     = "aws:kms"
    }
  }
}

resource "aws_dynamodb_table" "tf_remote_state_locking" {
  name           = "terraform-s3-backend-locking"
  billing_mode   = "PAY_PER_REQUEST"
  hash_key       = "LockID"
  attribute {
    name = "LockID"
    type = "S"
  }
}
