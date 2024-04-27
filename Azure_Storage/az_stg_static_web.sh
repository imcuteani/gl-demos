# Create Azure Static website
az storage blob service-properties update --account-name <storage-account-name> --static-website --404-document <error-document-name> --index-document <index-document-name>
# upload files 
az storage blob upload-batch -s <source-path> -d '$web' --account-name <storage-account-name>
# find the website url 
az storage account show -n <storage-account-name> -g <resource-group-name> --query "primaryEndpoints.web" --output tsv