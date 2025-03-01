resource "aws_ecr_repository" "node_ecr" {
  name = "nodejs-api-repo-${var.environment}"
}

output "ecr_repository_url" {
  value = aws_ecr_repository.node_ecr.repository_url
}
