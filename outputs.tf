output "adb-workspaceid" {
  value = azurerm_databricks_workspace.adb.workspace_id
  description = "workspace id of adb"
}

output "adb-workspaceurl" {
  value = azurerm_databricks_workspace.adb.workspace_url
  description = "workspace url of adb"
}
output "cluster_url" {
 value = databricks_cluster.test_cluster.url
 description = "url of adb cluster"
}
# output "notebook_url" {
#  value = databricks_notebook.test_nb.url
#  description = "url of adb notebook"
# }