resource "aws_security_group" "My_security_group" {
 
  
  description = "Security Group for the rabbitmq nodes"
  ingress {
    protocol        = "tcp"
    from_port       = 80
    to_port         = 80
    cidr_blocks = var.cidr_blocks
  }
   ingress {
    protocol        = "tcp"
    from_port       = 22
    to_port         = 22
     cidr_blocks = var.cidr_blocks
  }
  
  egress {
    protocol  = "-1"
    from_port = 0
    to_port   = 0
    cidr_blocks = var.cidr_blocks
  }
  tags = {
    Name = "My_securitygroup"
  }
}