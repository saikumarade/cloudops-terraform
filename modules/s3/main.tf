resource "aws_s3_bucket" "vulnerability-bucket" {
    bucket = "my-vulnerability-bucket-84640862"
    }
resource "aws_s3_bucket_versioning" "vulnerability-bucket" {

  bucket = aws_s3_bucket.vulnerability-bucket.id

  versioning_configuration {

    status = "Enabled"

  }

}
  

