#login to Azure account 
az login
# Create Azure Resource group 
az group create --name AzureFunctionsQuickstart-rg --location <REGION>
# Create Azure Storage Account 
az storage account create --name <STORAGE_NAME> --location <REGION> --resource-group AzureFunctionsQuickstart-rg --sku Standard_LRS
# Create Azure Function App
az functionapp create --resource-group AzureFunctionsQuickstart-rg --consumption-plan-location westeurope --runtime python --runtime-version <PYTHON_VERSION> --functions-version 4 --name <APP_NAME> --os-type linux --storage-account <STORAGE_NAME>
# Invoke the function App
func azure functionapp publish <APP_NAME>