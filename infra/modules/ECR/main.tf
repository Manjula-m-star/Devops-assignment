# Check if the ECR repository already exists
data "aws_ecr_repository" "existing_repo" {
  name = "my-demo-repo"
}

# Conditionally create ECR repository only if it doesn’t exist
resource "aws_ecr_repository" "app_repo" {
  count = length(try(data.aws_ecr_repository.existing_repo.repository_url, "")) > 0 ? 0 : 1
  name  = "my-demo-repo"

  # Prevent Terraform from modifying an existing repository
  lifecycle {
    prevent_destroy = true
 }





}