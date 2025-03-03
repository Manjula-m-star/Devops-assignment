# Check if ECR repository already exists
data "aws_ecr_repository" "existing_repo" {
  name = "my-demo-repo"
}

# Create ECR repository only if it doesn't exist
resource "aws_ecr_repository" "app_repo" {
  name = "my-demo-repo"
  
  lifecycle {
    ignore_changes = [image_tag_mutability, encryption_configuration]  # Prevent Terraform from modifying existing settings
  }

  depends_on = [data.aws_ecr_repository.existing_repo]
}