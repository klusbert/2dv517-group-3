resource "random_password" "db_password" { ## used for db user
  length           = 16
  special          = true
  override_special = "_%@"
}


resource "random_password" "grafana_password" {
  length           = 16
  special          = true
  override_special = "_%@"
}
