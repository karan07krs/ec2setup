resource "aws_route53_record" "as-record" {
  zone_id = var.zone_id
  name    = "my-site"
  type    = "A"
  ttl     = "300"

  geolocation_routing_policy {
    continent = "AS"
  }

  set_identifier = "Asia Web Service"
  records        = var.us-instance-public-ip
}


resource "aws_route53_record" "us-record" {
  zone_id = var.zone_id
  name    = "my-site"
  type    = "A"
  ttl     = "300"

  geolocation_routing_policy {
    continent = "NA"
  }

  set_identifier = "US Web Service"
  records        = var.us-instance-public-ip
}

resource "aws_route53_record" "uk-record" {
  zone_id = var.zone_id
  name    = "my-site"
  type    = "A"
  ttl     = "300"

  geolocation_routing_policy {
    continent = "EU"
  }

  set_identifier = "Europe Web Service"
  records        = var.uk-instance-public-ip
}