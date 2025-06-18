@description('Region for Application Insights')
param location string
@description('Application Insights Name')
param appInsightsName string
@description('Log Analytics Workspace Resource ID')
param logAnalyticsId string

@description('Create Application Insights')
resource appInsights 'Microsoft.Insights/components@2020-02-02' = {
  name: appInsightsName
  location: location
  kind: 'web'
  properties: {
    Application_Type: 'web'
    WorkspaceResourceId: logAnalyticsId
  }
}

output appInsightsId string = appInsights.id
output appInsightsInstrumentationKey string = appInsights.properties.InstrumentationKey
output appInsightsConnectionString string = appInsights.properties.ConnectionString
