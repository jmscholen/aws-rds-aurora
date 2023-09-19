resource "aws_rds_cluster_instance" "cluster_instances" {
  count              = var.instance_count 
  identifier         = "${local.resource_name}-instance-${count.index}"
  cluster_identifier = aws_rds_cluster.this.id
  instance_class     = var.instance_class
  engine             = aws_rds_cluster.this.engine
  engine_version     = aws_rds_cluster.this.engine_version
}

resource "aws_rds_cluster" "this" {
  cluster_identifier        = local.resource_name 
  engine                    = var.engine
  engine_mode               = var.engine_mode
  engine_version            = var.engine_version
  storage_encrypted         = true
  backup_retention_period   = var.backup_retention_period
  preferred_backup_window   = "02:00-03:00"
  db_subnet_group_name      = aws_db_subnet_group.this.name
  vpc_security_group_ids = [aws_security_group.this.id]
  
  final_snapshot_identifier = "${local.resource_name}-${replace(timestamp(), ":", "-")}"
  # iam_roles has been removed from this resource and instead will be used with aws_rds_cluster_role_association below to avoid conflicts per docs
  
  port                      = local.port

  tags                      = local.tags

  master_username = replace(data.ns_workspace.this.block_ref, "-", "_")
  master_password = random_password.this.result

  lifecycle {
    ignore_changes = [master_username, final_snapshot_identifier]
  }
}

resource "aws_db_subnet_group" "this" {
  name        = local.resource_name
  description = "Mysql db subnet group for mysql cluster"
  subnet_ids  = local.private_subnet_ids
  tags        = local.tags
}
