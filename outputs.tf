output "db_instance_arn" {
  value       = aws_rds_cluster.this.arn
  description = "string ||| ARN of the mysql instance"
}

output "db_master_secret_id" {
  value       = aws_secretsmanager_secret.password.id
  description = "string ||| The ID of the secret in AWS Secrets Manager containing the password"
}

output "db_endpoint" {
  value       = aws_rds_cluster.this.endpoint
  description = "string ||| The endpoint URL to access the mysql instance."
}

output "db_security_group_id" {
  value       = aws_security_group.this.id
  description = "string ||| The ID of the security group attached to the mysql instance."
}

output "db_user_security_group_id" {
  value       = aws_security_group.user.id
  description = "string ||| The ID of a security group that, when attached to a network device, allows access to the mysql instance."
}

output "db_admin_function_name" {
  value       = module.db_admin.function_name
  description = "string ||| AWS Lambda Function name for database admin utility"
}
