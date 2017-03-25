// CloudTrail setup to dump to S3 bucket
resource "aws_cloudtrail" "streamalert" {
  name                          = "${var.prefix}.${var.cluster}.streamalert.cloudtrail"
  s3_bucket_name                = "${aws_s3_bucket.cloudtrail_bucket.id}"
  s3_key_prefix                 = "cloudtrail"
  enable_logging                = "${var.enable_logging}"
  include_global_service_events = true
}

// S3 bucket for CloudTrail output
resource "aws_s3_bucket" "cloudtrail_bucket" {
  bucket        = "${var.prefix}.${var.cluster}.streamalert.cloudtrail"
  acl           = "private"
  force_destroy = false

  tags {
    Name    = "${var.prefix}.${var.cluster}.streamalert.cloudtrail"
    Cluster = "${var.cluster}"
  }
}

// S3 bucket for CloudWatch events
resource "aws_cloudwatch_event_rule" "all_events" {
  name        = "${var.prefix}_${var.cluster}_streamalert_all_events"
  description = "Capture all CloudWatch events"

  event_pattern = <<PATTERN
{
  "detail-type": [
    "AWS API Call via CloudTrail"
  ]
}
PATTERN
}

resource "aws_cloudwatch_event_target" "kinesis" {
  rule = "${aws_cloudwatch_event_rule.all_events.name}"
  arn  = "${var.kinesis_arn}"
}
