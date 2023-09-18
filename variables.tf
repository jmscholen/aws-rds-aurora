variable "instance_class" {
  type        = string
  default     = "db.t4g.medium"
  description = "Instance Class: There are limitations based on a combination of variables: https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/Concepts.DBInstanceClass.html"
}

variable "instance_count" {
  type        = number
  default     = 1
  description = "Number of instances to create"
}

variable "engine" {
  type        = string
  default     = "auora-mysql"
  description = "Database Engine: auora-mysql | aurora-postgres"
}

variable "engine_mode" {
  type        = string
  default     = "provisioned"
  description = "Engine Mode: provisioned | serverless"
}

variable "engine_version" {
  type        = string
  default     = "5.7.mysql_aurora.2.11.2"
  description = "Aurora Engine Version "
}

variable "backup_retention_period" {
  type        = number
  default     = 5
  description = "The number of days that each backup is retained"
}

locals {
  port = 3306
}
