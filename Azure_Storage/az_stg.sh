# Create Azure resource group 
az group create --name <resource-group> --location <location>
# Create Azure Storage Account 
az storage account create --name <storage-account> --resource-group <resource-group> --location <location> --sku Standard_ZRS --encryption-services blob
# Create Azure blob storage container 
az ad signed-in-user show --query id -o tsv | az role assignment create --role "Storage Blob Data Contributor" --assignee @- --scope "/subscriptions/<subscription>/resourceGroups/<resource-group>/providers/Microsoft.Storage/storageAccounts/<storage-account>"

az storage container create --account-name <storage-account> --name <container> --auth-mode login
#upload blob to a container 
az storage blob upload --account-name <storage-account> --container-name <container> --name myFile.txt --file myFile.txt --auth-mode login
# list blob in a container 
az storage blob list --account-name <storage-account> --container-name <container> --output table --auth-mode login
# download blob from a container 
az storage blob download --account-name <storage-account> --container-name <container> --name myFile.txt --file <~/destination/path/for/file> --auth-mode login
# Delete resource group
az group delete --name <resource-group> --no-wait