# Check if the ECR repository already exists
data "aws_ecr_repository" "existing_repo" {
  name = "my-demo-repo"
}

# Create ECR repository only if it doesn't exist
resource "aws_ecr_repository" "app_repo" {
  name = "my-demo-repo"

  # Ensure Terraform doesn't try to update the repo if it exists
  lifecycle {
    prevent_destroy = true
  }


}

