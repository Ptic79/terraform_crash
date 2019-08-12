locals {
  prefix        = "/${var.prefix}/${var.environment}"
  policy-prefix = "${var.prefix}-${var.environment}"
}

data "aws_caller_identity" "current" {}

data "aws_iam_policy_document" "parameter-policy-document" {
  statement {
    sid = "TerraformUse"
    actions = [
      "ssm:GetParametersByPath",
      "ssm:GetParameters",
      "ssm:GetParameter"
    ]
    effect = "Allow"
    resources = [
      "arn:aws:sns:${var.region}:${data.aws_caller_identity.current.account_id}:parameter${local.prefix}/*",
    ]
  }
}

resource "aws_iam_policy" "policy-parameter-access" {
  name        = "parameter-${local.policy-prefix}-access"
  description = "Read access to parameter ${local.policy-prefix}"
  path        = "/"
  policy      = data.aws_iam_policy_document.parameter-policy-document.json
}