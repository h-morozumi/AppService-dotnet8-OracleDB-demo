using './main.bicep'

@description('reagion')
param location = 'eastus2'

@description('Container Instance Oracle Name [a-z0-9]([-a-z0-9]*[a-z0-9])? e.g. my-name')
param containerName = 'oracle-ex'

@description('App Service Plan Name')
param appServicePlanName = 'myAppServicePlan'

@description('App Service Name')
param appServiceName = 'myAppService'

@description('Application Insights Name')
param appInsightsName = 'myAppInsights'

@description('Log Analytics Workspace Name')
param logAnalyticsName = 'myLogAnalytics'

@description('use azd up & deploy to set this value')
param tags = {
  'azd-service-name': 'webapp'
}
