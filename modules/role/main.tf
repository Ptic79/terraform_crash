data "aws_caller_identity" "current" {}

data "aws_iam_policy_document" "ecs-tasks-assume-role-policy" {
  statement {
    actions = ["sts:AssumeRole"]

    principals {
      type        = "Service"
      identifiers = ["ecs-tasks.amazonaws.com"]
    }
  }
}

resource "aws_iam_role" "role" {
  name               = "${var.environment}-${var.name}"
  path               = "/"
  assume_role_policy = data.aws_iam_policy_document.ecs-tasks-assume-role-policy.json
  tags = {
    Terraform   = "true"
    Environment = var.environment
  }
}

resource "aws_iam_role_policy_attachment" "role-policy_attachment" {
  for_each   = toset(var.policy_attachment)
  policy_arn = each.value
  role       = aws_iam_role.role.name
}
