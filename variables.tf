##################################################################
#_____ NETWORK __________________________________________________#
##################################################################
variable "vpc_configs" {
  type = object({
    name           = string
    cidr           = string
    azs            = list(string)
    public_subnets = list(string)
  })
  description = "A set of vpc's configs"
}

variable "sg_name" {
  type        = string
  description = "Security group's name"
}

variable "sg_ingress_rule" {
  type = object({
    from_port   = number
    to_port     = number
    protocol    = string
    cidr_blocks = list(string)
  })
  description = "Security group ingress rule"
}

variable "sg_egress_rule" {
  type = object({
    from_port        = number
    to_port          = number
    protocol         = string
    cidr_blocks      = list(string)
    ipv6_cidr_blocks = list(string)
  })
  description = "Security group egress rule"
}

##################################################################
#_____ VIRTUAL MACHINE __________________________________________#
##################################################################
variable "key_name" {
  type        = string
  description = "KMS key pair name"
}

variable "ec2_instance" {
  type = object({
    ami                         = string
    instance_type               = string
    associate_public_ip_address = bool
  })
}