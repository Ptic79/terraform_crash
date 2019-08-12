provider "aws" {
  version = "~> 2.0"

  region =  "eu-central-1"
}

module "policy" {
  source = "./modules/policy"

  environment = "test"
  prefix = "test"
  region = "eu-central-1"
  tags = {
    Terraform = "true"
    Environment = "test"
  }
}

module "ECSTaskExecutionRole" {
  source = "./modules/role"

  environment = "test"
  prefix      = "test"
  region      = "eu-central-1"
  tags = {
    Terraform   = "true"
    Environment = "test"
  }

  name = "ECSTaskExecutionRole"
  policy_attachment = [
    "arn:aws:iam::aws:policy/service-role/AmazonECSTaskExecutionRolePolicy",
    module.policy.policy-arn,
  ]
}