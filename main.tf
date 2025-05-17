
provider "aws" {
  region = "us-east-1" # Set the AWS region to US East (N. Virginia)
}

resource "aws_security_group" "security_group" {
  name        = local.sg_final_name
  description = var.description
  vpc_id      = var.vpc_id
  egress {
    from_port = 0
    to_port   = 0
    protocol  = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = merge(
    var.common_tags,
    var.sg_tags,
    {
      Name = local.sg_final_name
    }
  )
}