# api-gateway.tf
resource "aws_api_gateway_rest_api" "api_gateway" {
  name        = "Minha API"
  description = "AWS Rest API de exemplo com Terraform"
  endpoint_configuration {
    types = ["REGIONAL"]
  }
}
