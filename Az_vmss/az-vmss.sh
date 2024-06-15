# Create Azure resoure group 
az group create --name myResourceGroup --location eastus

# create Azure VM scale set

az vmss create --resource-group myResourceGroup 
--name myScaleSet --image <SKU image> 
--upgrade-policy-mode automatic 
--admin-username azureuser --generate-ssh-keys

# Install web app with custom script extension
az vmss extension set --publisher Microsoft.Azure.Extensions 
--version 2.0 --name CustomScript --resource-group myResourceGroup 
--vmss-name myScaleSet 
--settings '{"fileUris":["https://raw.githubusercontent.com/Azure-Samples/compute-automation-configurations/master/automate_nginx.sh"],"commandToExecute":"./automate_nginx.sh"}'

# allow traffic to app
az network lb rule create --resource-group myResourceGroup --name myLoadBalancerRuleWeb --lb-name myScaleSetLB 
--backend-pool-name myScaleSetLBBEPool 
--backend-port 80 --frontend-ip-name loadBalancerFrontEnd --frontend-port 80 --protocol tcp

# test the app 
az network public-ip show --resource-group myResourceGroup --name myScaleSetLBPublicIP 
--query '[ipAddress]' --output tsv

# Clean up resources 
az group delete --name myResourceGroup --yes --no-wait