# api-gateway.tf
resource "aws_api_gateway_rest_api" "api_gateway" {
  name        = "Minha API"
  description = "AWS Rest API de exemplo com Terraform"
  endpoint_configuration {
    types = ["REGIONAL"]
  }
}

resource "aws_api_gateway_resource" "minha-api" {
  rest_api_id = aws_api_gateway_rest_api.api_gateway.id
  parent_id   = aws_api_gateway_rest_api.api_gateway.root_resource_id
  path_part   = "minha-api"
}

resource "aws_api_gateway_resource" "v1" {
  rest_api_id = aws_api_gateway_rest_api.api_gateway.id
  parent_id   = aws_api_gateway_resource.minha-api.id
  path_part   = "v1"
}
