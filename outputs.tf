output "NHK-S3-Bucket-Name" {
  value = aws_s3_bucket.NHK-S3.id
}

output "NHK-dynamodb-Name" {
  value = aws_dynamodb_table.NHK-dynamo-table.id
}