variable "prefix" {
  type = "string"
}

variable "cluster" {
  type = "string"
}

variable "enable_logging" {
  default = true
}

variable "account_id" {
  type = "string"
}

variable "kinesis_arn" {
  type = "string"
}
