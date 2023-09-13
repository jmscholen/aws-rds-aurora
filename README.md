# aws-rds-aurora-cluster

Nullstone Block standing up AWS RDS Aurora Cluster

## Inputs

- `instance_class`: string - Mysql Instance Class - default: db.t4g.small
- `instance_count`: number - Number of Instances - default: 1
- `engine`: string - RDS Engine - default: aurora-mysql
- `engine_mode`: string - Engine Mode - default: provisioned
- `engine_version`: string - Engine Version - default: 5.7.mysql_aurora.2.11.2
- `backup_retention_period: number` - The days to retain backups - default: 5

## Outputs

- `db_instance_arn: string` - RDS Instance ARN
- `db_master_secret_id: string` - ID of AWS Secrets Manager Secret that holds database master credentials
- `db_endpoint: string` - RDS Connection Endpoint
- `db_security_group_id: string` - Security Group ID for RDS Cluster
- `db_user_security_group_id: string` - Security Group ID - Attach to any instance to gain access to the aurora cluster
- `db_admin_function_name`: string - AWS Lambda Function Name for db admin utility
