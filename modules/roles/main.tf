resource "aws_iam_policy" "dynamodb_full_access" {
  name        = "dynamodb-full-access"
  policy      = data.aws_iam_policy_document.dynamodb_full_access.json
  description = "Provides full access to DynamoDB"
  arn         = "arn:aws:iam::aws:policy/AmazonDynamoDBFullAccess"
}

data "aws_iam_policy_document" "dynamodb_full_access" {
  statement {
    effect = "Allow"
    actions = [
      "dynamodb:*"
    ]
    resources = [
      "*"
    ]
  }
}

resource "aws_iam_role" "dynamodb_role" {
  name = "dynamodb-role"
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "dynamodb_policy_attachment" {
  policy_arn = aws_iam_policy.dynamodb_full_access.arn
  role       = aws_iam_role.dynamodb_role.name
}
