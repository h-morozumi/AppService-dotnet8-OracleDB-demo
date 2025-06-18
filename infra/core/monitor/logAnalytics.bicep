@description('Region for Log Analytics Workspace')
param location string
@description('Log Analytics Workspace Name')
param logAnalyticsName string

@description('Log Analytics Workspace SKU (e.g., PerGB2018, Standalone)')
resource logAnalytics 'Microsoft.OperationalInsights/workspaces@2025-02-01' = {
  name: logAnalyticsName
  location: location
  properties: {
    retentionInDays: 30
    sku: {
      name: 'PerGB2018'
    }
  }
}

output logAnalyticsId string = logAnalytics.id
