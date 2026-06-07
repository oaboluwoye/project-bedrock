resource "aws_dynamodb_table" "products" {
  name         = "bedrock-products"
  billing_mode = "PAY_PER_REQUEST"

  hash_key = "product_id"

  attribute {
    name = "product_id"
    type = "S"
  }

  tags = {
    Name = "bedrock-products"
  }
}

output "dynamodb_table_name" {
  value = aws_dynamodb_table.products.name
}