# Azure CLI automation script to deploy Azure Container Registry 

# Create a resource group
az group create --name gldevopsacr-rg --location centralindia

# Create a container registry
az acr create --resource-group gldevopsacr-rg --name glacropsdemo --sku Basic

# Delete Azure Resource Group 
az group delete --name gldevopsacr-rg