# Create Azure Stream Analytics Job 
az stream-analytics job create --job-name "streamanalyticsjob" --resource-group "streamanalyticsrg" 
--location "eastus" --output-error-policy "Drop" --out-of-order-policy "Drop" --order-max-delay 5 
--arrival-max-delay 16 --data-locale "en-US"