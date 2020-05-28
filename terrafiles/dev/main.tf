provider "aws" {
  access_key = "AKIAVCNYIAQAKZLBVA3B"
  secret_key = "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"
  region = "us-east-1"
}
provider "aws" {
  access_key = "AKIAVCNYIAQAKZLBVA3B"
  secret_key = "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"
  alias  = "west"
  
  region = "eu-west-3"
}

module "instance-us"{
  source = "../modules/instances"
  security_group =["${module.securitygroup-us.security_group}"]
  instance_type = "t2.micro"
}
module "instance-uk"{
  providers = {
    aws = aws.west
  }
  source = "../modules/instances"
  security_group = ["${module.securitygroup-uk.security_group}"]
  instance_type = "t2.micro"
}
module "securitygroup-us"{
  source =  "../modules/security_group"
}
module "securitygroup-uk"{
  providers = {
    aws = aws.west
  }
  source =  "../modules/security_group"
}
module "route53"{
  source =  "../modules/route53"
  us-instance-public-ip = ["${module.instance-us.public-ip}"]
  uk-instance-public-ip = ["${module.instance-uk.public-ip}"]
  zone_id = "Z05543652XTSBHWYEUNGV"
}