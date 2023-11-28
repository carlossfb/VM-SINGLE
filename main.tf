##################################################################
#_____ NETWORK __________________________________________________#
##################################################################
module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "5.2.0"

  name = var.vpc_configs.name
  cidr = var.vpc_configs.cidr

  azs            = var.vpc_configs.azs
  public_subnets = var.vpc_configs.public_subnets
}


resource "aws_security_group" "aws_security_group" {
  name   = var.sg_name
  vpc_id = module.vpc.vpc_id

  ingress {
    from_port   = var.sg_ingress_rule.from_port
    to_port     = var.sg_ingress_rule.to_port
    protocol    = var.sg_ingress_rule.protocol
    cidr_blocks = var.sg_ingress_rule.cidr_blocks
  }

  egress {
    from_port        = var.sg_egress_rule.from_port
    to_port          = var.sg_egress_rule.to_port
    protocol         = var.sg_egress_rule.protocol
    cidr_blocks      = var.sg_egress_rule.cidr_blocks
    ipv6_cidr_blocks = var.sg_egress_rule.ipv6_cidr_blocks
  }
}

##################################################################
#_____ VIRTUAL MACHINE __________________________________________#
##################################################################
resource "aws_key_pair" "key" {
  key_name   = var.key_name
  public_key = file("./key.pub")
}

resource "aws_instance" "vm" {
  ami                         = var.ec2_instance.ami
  instance_type               = var.ec2_instance.instance_type
  key_name                    = aws_key_pair.key.key_name
  subnet_id                   = module.vpc.public_subnets[0]
  vpc_security_group_ids      = [aws_security_group.aws_security_group.id]
  associate_public_ip_address = var.ec2_instance.associate_public_ip_address
}