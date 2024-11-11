import {
  to = aws_lambda_function.this
  id = "test-function-x"
}

resource "aws_lambda_function" "this" {
  architectures                      = ["x86_64"]
  function_name                      = "test-function-x"
  handler                            = "lambda_function.lambda_handler"
  image_uri                          = null
  kms_key_arn                        = null
  layers                             = []
  memory_size                        = 128
  package_type                       = "Zip"
  publish                            = null
  replace_security_groups_on_destroy = null
  replacement_security_group_ids     = null
  reserved_concurrent_executions     = -1
  role                               = "arn:aws:iam::533267257785:role/service-role/test-function-x-role-hms2d279"
  runtime                            = "python3.11"
  source_code_hash                   = null
  tags                               = {}
  tags_all                           = {}
  timeout                            = 3
  ephemeral_storage {
    size = 512
  }
  logging_config {
    application_log_level = null
    log_format            = "Text"
    log_group             = "/aws/lambda/test-function-x"
    system_log_level      = null
  }
  tracing_config {
    mode = "PassThrough"
  }
}