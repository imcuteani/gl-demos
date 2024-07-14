#login to Azure account 
az login
# Create Azure Resource group 
az group create --name glserverlessdemo-rg --location centralindia
# Create Azure Storage Account 
az storage account create --name glfuncdemostg --location centralindia --resource-group glserverlessdemo-rg --sku Standard_LRS 
# Create Azure Function App
az functionapp create --resource-group glserverlessdemo-rg --consumption-plan-location centralindia --runtime python --runtime-version 3.10 --functions-version 4 --name httptriggergldemo --os-type linux --storage-account glfuncdemostg
# Invoke the function App
func azure functionapp publish httptriggergldemo
# Delete the Azure resource group 
az group delete --name glserverlessdemo-rg
