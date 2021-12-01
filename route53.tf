# Set some defaults for AWS like region.
#provider "aws" {
# profile = "default"
# region  = "us-east-1"
#}

# Select the correct zone from Route53
data "aws_route53_zone" "selected" {
  name         = "kapilkumaria.com"
  private_zone = false
}# Set a record - home.example.com in this example - that contains # the IP of your home ISP connection

resource "aws_route53_record" "home" {
  zone_id = "${data.aws_route53_zone.selected.zone_id}"
  name    = "${data.aws_route53_zone.selected.name}"
  type    = "A"
  #ttl     = "300"
  
  alias {
      name = aws_lb.myalb.dns_name
      zone_id = aws_lb.myalb.zone_id
      evaluate_target_health = true
  }
}

resource "aws_route53_record" "www" {
  zone_id = "${data.aws_route53_zone.selected.zone_id}"
  name    = "www.${data.aws_route53_zone.selected.name}"
  type    = "A"
  #ttl     = "300"
  
  alias {
      name = aws_lb.myalb.dns_name
      zone_id = aws_lb.myalb.zone_id
      evaluate_target_health = true
  }
}

resource "aws_route53_record" "b" {
  zone_id = "${data.aws_route53_zone.selected.zone_id}"
  name    = "*.${data.aws_route53_zone.selected.name}"
  type    = "A"
  #ttl     = "300"
  
  alias {
      name = aws_lb.myalb.dns_name
      zone_id = aws_lb.myalb.zone_id
      evaluate_target_health = true
  }
}