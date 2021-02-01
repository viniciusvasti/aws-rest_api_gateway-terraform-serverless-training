# api-gateway.tf
resource "aws_api_gateway_rest_api" "my_api_gateway" {
  name        = "Minha API"
  description = "AWS Rest API example with Terraform"
  endpoint_configuration {
    types = ["REGIONAL"]
  }
}

resource "aws_api_gateway_resource" "my_api" {
  rest_api_id = aws_api_gateway_rest_api.my_api_gateway.id
  parent_id   = aws_api_gateway_rest_api.my_api_gateway.root_resource_id
  path_part   = "my-api"
}

resource "aws_api_gateway_resource" "v1" {
  rest_api_id = aws_api_gateway_rest_api.my_api_gateway.id
  parent_id   = aws_api_gateway_resource.my_api.id
  path_part   = "v1"
}
