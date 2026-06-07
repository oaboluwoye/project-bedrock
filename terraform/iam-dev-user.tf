resource "aws_iam_user" "dev_view" {
  name = "bedrock-dev-view"
}

resource "aws_iam_user_policy_attachment" "dev_readonly" {
  user       = aws_iam_user.dev_view.name
  policy_arn = "arn:aws:iam::aws:policy/ReadOnlyAccess"
}

resource "aws_iam_policy" "dev_s3_put_assets" {
  name = "bedrock-dev-view-s3-put-assets"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Effect = "Allow"
      Action = [
        "s3:PutObject"
      ]
      Resource = "${aws_s3_bucket.assets.arn}/*"
    }]
  })
}

resource "aws_iam_user_policy_attachment" "dev_s3_put_assets" {
  user       = aws_iam_user.dev_view.name
  policy_arn = aws_iam_policy.dev_s3_put_assets.arn
}

resource "aws_iam_access_key" "dev_view_key" {
  user = aws_iam_user.dev_view.name
}

resource "aws_iam_user_login_profile" "dev_view_console" {
  user                    = aws_iam_user.dev_view.name
  password_reset_required = false
}

output "dev_view_access_key_id" {
  value = aws_iam_access_key.dev_view_key.id
}

output "dev_view_secret_access_key" {
  value     = aws_iam_access_key.dev_view_key.secret
  sensitive = true
}

output "dev_view_console_username" {
  value = aws_iam_user.dev_view.name
}

output "dev_view_console_password" {
  value     = aws_iam_user_login_profile.dev_view_console.password
  sensitive = true
}