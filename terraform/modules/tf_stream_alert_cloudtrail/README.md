# Stream Alert CloudTrail Terraform Module
* This Terraform module sets up CloudTrail to enable logging of AWS API calls to an S3 bucket.

## Components
* Creates an S3 bucket for storing CloudTrail output
* Creates CloudTrail resource for writing to S3 bucket

## Example
```
module "cloudtrail" {
  source         = "modules/tf_stream_alert_cloudtrail"
  prefix         = "streamalert"
  cluster        = "prod"
  enable_logging = "${var.enable_logging}"
  account_id     = "${lookup(var.account, "aws_account_id")}"
  kinesis_arn    = "${var.kinesis_arn}"
}
```

## Inputs
<table>
  <tr>
    <th>Property</th>
    <th>Description</th>
    <th>Default</th>
    <th>Required</th>
  </tr>
  <tr>
    <td>prefix</td>
    <td>Resource prefix</td>
    <td>None</td>
    <td>True</td>
  </tr>
  <tr>
    <td>cluster</td>
    <td>Name of the cluster</td>
    <td>None</td>
    <td>True</td>
  </tr>
  <tr>
    <td>enable_logging</td>
    <td>Enables logging for the trail</td>
    <td>true</td>
    <td>False</td>
  </tr>
  <tr>
    <td>account_id</td>
    <td>AWS account id.</td>
    <td>None</td>
    <td>True</td>
  </tr>
  <tr>
    <td>kinesis_arn</td>
    <td>The Amazon Resource Name of the kinesis stream to send CloudTrail logs to</td>
    <td>None</td>
    <td>True</td>
  </tr>
</table>
