variable "ami1" {
  default = "ami-00077e3fed5089981"
}
variable "ami2" {
  default = "ami-00077e3fed5089981"
}
variable "instance_type"{
  default = "t2.micro"
}

variable "cidr_blocks" {
  default = ["0.0.0.0/0"]
}