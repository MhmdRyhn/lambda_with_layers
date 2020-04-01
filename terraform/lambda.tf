resource "aws_lambda_function" "terra_ground" {
  function_name = "terraground"
  description = "This is a function created using terraform during learning"
  filename = data.archive_file.lambda_function_zip.output_path
  handler = "sample.lambda_handler"
  source_code_hash = data.archive_file.lambda_function_zip.output_base64sha256
  role = data.aws_iam_role.lambda_m2a_role.arn
  runtime = "python3.8"
  timeout = 10
  layers = [aws_lambda_layer_version.lambda_layer_marshmallow.arn]
}