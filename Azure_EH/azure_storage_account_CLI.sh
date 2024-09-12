# create Azure Storage account 

storageAccountName="asatutorialstorage$RANDOM"
az storage account create --name $storageAccountName --resource-group streamanalyticsrg 
--location eastus --sku Standard_LRS --encryption-services blob

# Get the Storage account key 

key=$(az storage account keys list -g streamanalyticsrg -n $storageAccountName --query "[0].value" -o tsv)
echo $key

# Create Storage account container 
az storage container create --account-name $storageAccountName --name state --account-key $key --auth-mode key