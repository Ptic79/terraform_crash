output "policy" {
  value = aws_iam_policy.policy-parameter-access
}

output "policy-arn" {
  value = aws_iam_policy.policy-parameter-access.arn
}