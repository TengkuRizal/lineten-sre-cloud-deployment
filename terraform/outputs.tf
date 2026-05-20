output "acr_login_server" {
  value = azurerm_container_registry.main.login_server
}

output "app_url" {
  value = "https://${azurerm_container_app.main.latest_revision_fqdn}"
}
