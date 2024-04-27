


$startDate = (Get-Date).AddDays(-7)
$endDate = Get-Date
$dtuMetric = Get-AzMetric -ResourceId "/subscriptions/07ee4d7d-00ae-4ebd-b4fd-ff11533f5667/resourceGroups/GL-azure-demo/providers/Microsoft.Sql/servers/glazsqlserv/databases/gl-az-db-demo" -MetricName "dtu_consumption_percent" -StartTime $startDate -EndTime $endDate -TimeGrain 00:05:00 -AggregationType "Maximum"
Write-Host $dtuMetric.Data

$subscriptionId = "07ee4d7d-00ae-4ebd-b4fd-ff11533f5667"
$rg = "GL-azure-demo"
$azsqlserver = "glazsql"
$azsqldb = "glazsqldemo"
$timeGrain = "12:00:00"

$MonitorSQLParameters = @{
    ResourceId = "/subscriptions/$subscriptionId/resourceGroups/$rg/providers/Microsoft.Sql/servers/$azsqlserver/databases/$azsqldb"
    MetricNames = "dtu_consumption_percent"
    AggregationType = "Maximum"
    StartTime = (Get-Date).AddDays(-7)
    EndTime = Get-Date
    TimeGrain = $timeGrain
  }
  $metric = Get-AzMetric @MonitorSQLParameters 
  $metric.Data 


  /subscriptions/07ee4d7d-00ae-4ebd-b4fd-ff11533f5667/resourceGroups/GL-azure-demo/providers/Microsoft.Sql/servers/glazsql/databases/glazsqldemo
 
    