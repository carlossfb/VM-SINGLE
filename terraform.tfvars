##################################################################
#_____ NETWORK __________________________________________________#
##################################################################
vpc_configs = {
  name           = "zabbix"
  cidr           = "10.0.0.0/16"
  azs            = ["us-east-1a", "us-east-1b"]
  public_subnets = ["10.0.1.0/24"]
}

sg_name = "security-group-dev"

sg_ingress_rule = {
  from_port   = 22
  to_port     = 22
  protocol    = "tcp"
  cidr_blocks = ["187.57.101.147/32"]
}

sg_egress_rule = {
  from_port        = 0
  to_port          = 0
  protocol         = "-1"
  cidr_blocks      = ["0.0.0.0/0"]
  ipv6_cidr_blocks = ["::/0"]
}

##################################################################
#_____ VIRTUAL MACHINE __________________________________________#
##################################################################
key_name = "aws-key"

ec2_instance = {
  ami                         = "ami-00b9afbf6b23bd3e3"
  instance_type               = "t2.micro"
  associate_public_ip_address = true
}