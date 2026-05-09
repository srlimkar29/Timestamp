data "aws_iam_policy_document" "assume_role" {
  statement {
    effect = "Allow"

    principals {
      type        = "Service"
      identifiers = ["lambda.amazonaws.com"]
    }

    actions = ["sts:AssumeRole"]
  }
}

# Role for AWS Lambda
resource "aws_iam_role" "iam_for_lambda" {
  name               = "iam_role_for_lambda"
  assume_role_policy = data.aws_iam_policy_document.assume_role.json
}

# Compress Python File to Zip
data "archive_file" "lambda" {
  type        = "zip"
  source_file = "${path.module}/lambda_function_payload.py"
  output_path = "${path.module}/lambda_function_payload.zip"
}

# Create AWS Lambda
resource "aws_lambda_function" "timestamp_lambda" {
  filename      = "${path.module}/lambda_function_payload.zip"
  function_name = "${var.project_name}-${var.environment}-lambda"
  role          = aws_iam_role.iam_for_lambda.arn
  handler       = "lambda_function_payload.lambda_handler"
  # api_deployment_arn =
  source_code_hash = data.archive_file.lambda.output_base64sha256

  runtime = "python3.10"

  tags = {
    Name = "${var.project_name}-${var.environment}-lambda"
  }
}
