data "aws_iam_policy_document" "lambda_assume_role" {
  statement {
    effect = "Allow"

    principals {
      type        = "Service"
      identifiers = ["lambda.amazonaws.com"]
    }

    actions = [
      "sts:AssumeRole"
    ]
  }
}

resource "aws_iam_role" "lambda" {
  name = "${var.function_name}-role"

  assume_role_policy = data.aws_iam_policy_document.lambda_assume_role.json

  tags = {
    Name = "${var.function_name}-role"
  }
}

resource "aws_iam_role_policy_attachment" "lambda_basic_execution" {
  role       = aws_iam_role.lambda.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"
}

data "archive_file" "lambda" {
  type        = "zip"
  source_file = "${path.root}/lambda/lambda_function.py"
  output_path = "${path.root}/lambda/lambda_function.zip"
}

resource "aws_lambda_function" "current_time" {
  function_name = var.function_name

  filename         = data.archive_file.lambda.output_path
  source_code_hash = data.archive_file.lambda.output_base64sha256

  role = aws_iam_role.lambda.arn

  handler = "lambda_function.lambda_handler"
  runtime = "python3.12"

  depends_on = [
    aws_iam_role_policy_attachment.lambda_basic_execution
  ]

  tags = {
    Name = var.function_name
  }
}