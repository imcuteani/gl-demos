# Azure CLI automation script to deploy Azure Container Registry 

# Create a resource group
az group create --name "<your_resource_group>" --location "<your_resource_group_location>"

# Create a container registry
az acr create --resource-group "<your_resource_group>" --name "<your_acr_demo>" --sku Basic

# Delete Azure Resource Group 
az group delete --name "<your_resource_group>"