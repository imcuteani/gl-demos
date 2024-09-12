# Create Azure Resource group 
rgName="contosorg$RANDOM"
region="eastus"
az group create --name $rgName --location $region

# Create Azure Event Hub Namespace 
# Create an Event Hubs namespace. Specify a name for the Event Hubs namespace.
namespaceName="contosoehubns$RANDOM"
az eventhubs namespace create --name $namespaceName --resource-group $rgName -l $region

# Create Azure Event Hub 
# Create an event hub. Specify a name for the event hub. 
eventhubName="contosoehub$RANDOM"
az eventhubs eventhub create --name $eventhubName --resource-group $rgName --namespace-name $namespaceName