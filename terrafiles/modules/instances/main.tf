data "aws_ami_ids" "amazon-linux-2" {
  owners = ["amazon"]
  filter {
    name   = "owner-alias"
    values = ["amazon"]
   }
  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }
}

resource "aws_instance" "instance"{
    ami                = data.aws_ami_ids.amazon-linux-2.ids[0]
    instance_type      = var.instance_type    
    security_groups    = var.security_group
    key_name = "mynewkey"
    user_data = <<-EOF
		       #! /bin/bash
            yum update -y
            yum install -y httpd
            service httpd start
            sudo curl -LkSs https://api.github.com/repos/karan07krs/NodeWorld/zipball?access_token=68ecce29f3000b10fb9e33c1c226758635c0d685 -o master.zip
            sudo unzip master.zip
            sudo rm -r master.zip
            echo "<h1>Deployed via Terraform</h1>" | sudo tee /var/www/html/index.html
		  EOF
    tags = {
        Name = "desperados_instance"
    }
}