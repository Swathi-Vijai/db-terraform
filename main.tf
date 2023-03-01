resource "azurerm_databricks_workspace" "adb" {
   name                = var.data-bricks-name
  resource_group_name = var.rsgrp
  location            = var.location
   sku                 = "standard"
   tags = var.tags
}
data "databricks_node_type" "smallest" {
  depends_on = [azurerm_databricks_workspace.adb]
  local_disk= true
  category = "Memory Optimized"

}

data "databricks_spark_version" "latest_lts" {
  depends_on = [azurerm_databricks_workspace.adb]
  long_term_support = true
}

resource "databricks_instance_pool" "pool" {
  depends_on = [azurerm_databricks_workspace.adb]
  instance_pool_name = var.instance-pool-name
  min_idle_instances = 0
  max_capacity =  var.instance_pool_max_capacity
  node_type_id = data.databricks_node_type.smallest.id
  idle_instance_autotermination_minutes = var.cluster_autotermination_minutes
   
}

resource "databricks_cluster" "test_cluster" {
  depends_on = [databricks_instance_pool.pool]
 # instance_pool_id = databricks_instance_pool.pool.id
  cluster_name = var.cluster-name
 spark_version = data.databricks_spark_version.latest_lts.id

  node_type_id = data.databricks_node_type.smallest.id
  autotermination_minutes = var.cluster_autotermination_minutes
  autoscale {
    min_workers = 0
    max_workers = 2
  }
  custom_tags = var.tags
}

data "databricks_current_user" "me" {
    depends_on = [azurerm_databricks_workspace.adb]
}

resource "databricks_notebook" "test_nb" {
  path     = "${data.databricks_current_user.me.home}/${var.notebook_subdirectory}/${var.notebook_filename}"
  language = var.notebook_language
  source   = "./${var.notebook_filename}"
}






