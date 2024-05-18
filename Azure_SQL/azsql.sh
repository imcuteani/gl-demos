subscription="<subscriptionId>" # add subscription here

az account set -s $subscription # ...or use 'az login'

# Create Azure SQL Server & Database 

# Create a single database and configure a firewall rule
# Variable block
let "randomIdentifier=$RANDOM*$RANDOM"
location="East US"
resourceGroup="msdocs-azuresql-rg-$randomIdentifier"
tag="create-and-configure-database"
server="msdocs-azuresql-server-$randomIdentifier"
database="msdocsazuresqldb$randomIdentifier"
login="azureuser"
password="Pa$$w0rD-$randomIdentifier"
# Specify appropriate IP address values for your environment
# to limit access to the SQL Database server
startIp=0.0.0.0
endIp=0.0.0.0

echo "Using resource group $resourceGroup with login: $login, password: $password..."
echo "Creating $resourceGroup in $location..."
az group create --name $resourceGroup --location "$location" --tags $tag
echo "Creating $server in $location..."

# Azure SQL Server Creation 

az sql server create --name $server --resource-group $resourceGroup --location "$location" --admin-user $login --admin-password $password
echo "Configuring firewall..."

# Azure SQL Server Firewall rule create 
az sql server firewall-rule create --resource-group $resourceGroup --server $server -n AllowYourIp --start-ip-address $startIp --end-ip-address $endIp
echo "Creating $database on $server..."

# Create Azure SQL db Create
az sql db create --resource-group $resourceGroup --server $server --name $database --sample-name AdventureWorksLT --edition GeneralPurpose --family Gen5 --capacity 2 --zone-redundant true # zone redundancy is only supported on premium and business critical service tiers

# Delete the resource group
az group delete --name $resourceGroup