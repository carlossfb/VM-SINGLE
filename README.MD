## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >=1.0.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | 5.26.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 5.26.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_vpc"></a> [vpc](#module\_vpc) | terraform-aws-modules/vpc/aws | 5.2.0 |

## Resources

| Name | Type |
|------|------|
| [aws_instance.vm](https://registry.terraform.io/providers/hashicorp/aws/5.26.0/docs/resources/instance) | resource |
| [aws_key_pair.key](https://registry.terraform.io/providers/hashicorp/aws/5.26.0/docs/resources/key_pair) | resource |
| [aws_security_group.aws_security_group](https://registry.terraform.io/providers/hashicorp/aws/5.26.0/docs/resources/security_group) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_ec2_instance"></a> [ec2\_instance](#input\_ec2\_instance) | n/a | <pre>object({<br>    ami                         = string<br>    instance_type               = string<br>    associate_public_ip_address = bool<br>  })</pre> | n/a | yes |
| <a name="input_key_name"></a> [key\_name](#input\_key\_name) | KMS key pair name | `string` | n/a | yes |
| <a name="input_sg_egress_rule"></a> [sg\_egress\_rule](#input\_sg\_egress\_rule) | Security group egress rule | <pre>object({<br>    from_port        = number<br>    to_port          = number<br>    protocol         = string<br>    cidr_blocks      = list(string)<br>    ipv6_cidr_blocks = list(string)<br>  })</pre> | n/a | yes |
| <a name="input_sg_ingress_rule"></a> [sg\_ingress\_rule](#input\_sg\_ingress\_rule) | Security group ingress rule | <pre>object({<br>    from_port   = number<br>    to_port     = number<br>    protocol    = string<br>    cidr_blocks = list(string)<br>  })</pre> | n/a | yes |
| <a name="input_sg_name"></a> [sg\_name](#input\_sg\_name) | Security group's name | `string` | n/a | yes |
| <a name="input_vpc_configs"></a> [vpc\_configs](#input\_vpc\_configs) | A set of vpc's configs | <pre>object({<br>    name           = string<br>    cidr           = string<br>    azs            = list(string)<br>    public_subnets = list(string)<br>  })</pre> | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_vm_ip"></a> [vm\_ip](#output\_vm\_ip) | Ip da sua VM |
