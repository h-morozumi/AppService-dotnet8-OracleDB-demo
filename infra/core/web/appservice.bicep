@description('App Service Name')
param appServiceName string
@description('App Service Region')
param location string
@description('App Service Plan ID')
param appServicePlanId string

param appSettings array = []
param windowsFxVersion string = 'DOTNET|8.0'
param netFrameworkVersion string = 'v8.0'
param kind string = 'app,windows'
param tags object = {}

@description('Create App Service')
resource appService 'Microsoft.Web/sites@2024-11-01' = {
  name: appServiceName
  location: location
  kind: kind
  tags: tags
  properties: {
    serverFarmId: appServicePlanId
    siteConfig: {
      windowsFxVersion: windowsFxVersion
      netFrameworkVersion: netFrameworkVersion
      appSettings: appSettings
    }
    httpsOnly: true
  }
}

