data "aws_iam_role" "lambda_m2a_role" {
  name = var.sample_lambda_role_name
}

data "archive_file" "lambda_function_zip" {
  type = "zip"
  source_dir = "../sample_lambda"
  output_path = "../.build/lambda_function.zip"
}

//data "archive_file" "lambda_layer_zip" {
//  type = "zip"
//  source_dir = "../venv/lib"
//  output_path = "../zip/libraries.zip"
//}

//data "external" "prepare_layer_zip" {
//  program = ["bash", "${path.module}/build.sh"]
//  working_dir = path.module
//}

data "null_data_source" "package_source" {
  inputs = {
    path = "${path.module}/../.build"
  }
}

resource "null_resource" "build" {
  triggers = {
//    run = timestamp()
    policy_sha1 = sha1(file("${path.module}/../requirements.txt"))
  }

  provisioner "local-exec" {
    command = "${path.module}/build.sh"
  }
}

data "archive_file" "lambda_layer_zip" {
  type = "zip"
  source_dir = "${path.module}/../.build/dist"
  output_path = "${path.module}/../.build/libraries.zip"

  depends_on = [null_resource.build]
}
