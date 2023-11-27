# ssh-keygen -f key
resource "aws_key_pair" "key" {
  key_name   = "aws-key"
  public_key = file("./key.pub")
}

resource "aws_instance" "vm" {
  ami                         = "ami-00b9afbf6b23bd3e3"
  instance_type               = "t2.micro"
  key_name                    = aws_key_pair.key.key_name
  subnet_id                   = module.vpc.public_subnets[0]
  vpc_security_group_ids      = [aws_security_group.aws_security_group.id]
  associate_public_ip_address = true

}

