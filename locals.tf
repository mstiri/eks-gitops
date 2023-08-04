locals {
  cluster_name = "${var.environment}_${var.region}_cluster"
  azs          = slice(data.aws_availability_zones.available.names, 0, 3)
  tags = {
    environment = var.environment
    managed_by  = "terraform"
  }

}
