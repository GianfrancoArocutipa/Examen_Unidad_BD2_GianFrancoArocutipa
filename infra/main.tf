# 1. Definir el proveedor (quién nos da la nube)
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"
    }
  }
}

provider "azurerm" {
  features {}
}

# 2. Crear un Grupo de Recursos (la "carpeta" donde estará todo)
resource "azurerm_resource_group" "rg" {
  name     = "rg-examen-unidad2-gianfranco"
  location = "East US" # Ubicación del servidor
}

# 3. Crear el Plan de Servicio (el "motor" del servidor)
resource "azurerm_service_plan" "sp" {
  name                = "plan-gratuito-upt"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  os_type             = "Linux"
  sku_name            = "F1" # IMPORTANTE: F1 es el nivel GRATUITO
}

# 4. Crear la App Service (donde se subirá tu código C#)
resource "azurerm_linux_web_app" "app" {
  name                = "app-ventas-gianfranco-upt" # Nombre único en el mundo
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  service_plan_id     = azurerm_service_plan.sp.id

  site_config {
    application_stack {
      dotnet_version = "8.0" # Debe coincidir con tu proyecto C#
    }
  }
}