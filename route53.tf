resource "aws_route53_zone" "main" {
  name = "example.com"
}

resource "aws_route53_record" "alb" {
  zone_id = aws_route53_zone.main.zone_id
  name    = "dev.example.com"
  type    = "A"

  alias {
    name                   = aws_lb.main.dns_name
    zone_id                = aws_lb.main.zone_id
    evaluate_target_health = true
  }
}

# resource "aws_route53_record" "dev-web" {
#   zone_id = aws_route53_zone.main.zone_id
#   name    = "dev-web.example.com"
#   type    = "A"
#   ttl     = 300
#   records = ["1.2.3.4"]
# }


# resource "aws_route53_record" "dev-api" {
#   zone_id = aws_route53_zone.main.zone_id
#   name    = "dev-api.example.com"
#   type    = "A"
#   ttl     = 300
#   records = ["1.2.3.4"]
# }