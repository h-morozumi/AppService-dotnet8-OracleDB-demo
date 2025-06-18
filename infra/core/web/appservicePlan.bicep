@description('App Service Plan Name')
param appServicePlanName string
@description('App Service Region')
param location string
@description('App Service Plan SKU (e.g., F1, B1, S1)')
param skuName string = 'F1'
@description('App Service Plan Tier (Free, Basic, Standard)')
param skuTier string = 'Free'

@description('App Service Plan SKU')
resource appServicePlan 'Microsoft.Web/serverfarms@2024-11-01' = {
  name: appServicePlanName
  location: location
  sku: {
    name: skuName
    tier: skuTier
  }
  properties: {
    reserved: false
  }
}

output appServicePlanId string = appServicePlan.id
