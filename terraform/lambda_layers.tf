resource "aws_lambda_layer_version" "lambda_layer_marshmallow" {
  layer_name = "marshmallow"
  description = "marshmallow v3.5.1"
  filename = data.archive_file.lambda_layer_zip.output_path
//  filename = data.external.prepare_layer_zip.result.layer_path
  source_code_hash = data.archive_file.lambda_layer_zip.output_base64sha256
  compatible_runtimes = ["python3.8"]
}
