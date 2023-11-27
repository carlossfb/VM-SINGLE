module "vpc" {
  source = "terraform-aws-modules/vpc/aws"
  version = "5.2.0"
  
  name = "zabbix"
  cidr = "10.0.0.0/16"

  azs            = ["eu-central-1a"]
  public_subnets = ["10.0.1.0/24"]
}


resource "aws_security_group" "aws_security_group" {
  name   = "security-group-dev"
  vpc_id = module.vpc.vpc_id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/24"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

}