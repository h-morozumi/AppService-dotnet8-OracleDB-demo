@description('App Service Name')
param appServiceName string
@description('App Service Region')
param location string
param appServicePlanId string
param windowsFxVersion string = 'DOTNET|8.0'
param netFrameworkVersion string = 'v8.0'
param oracleIp string
param appInsightsInstrumentationKey string
param appInsightsConnectionString string

@description('Create App Service')
resource appService 'Microsoft.Web/sites@2024-11-01' = {
  name: appServiceName
  location: location
  kind: 'app,windows'
  properties: {
    serverFarmId: appServicePlanId
    siteConfig: {
      windowsFxVersion: windowsFxVersion
      netFrameworkVersion: netFrameworkVersion
      appSettings: [
        {
          name: 'APPINSIGHTS_INSTRUMENTATIONKEY'
          value: appInsightsInstrumentationKey
        }
        {
          name: 'APPLICATIONINSIGHTS_CONNECTION_STRING'
          value: appInsightsConnectionString
        }
        {
          name: 'ApplicationInsightsAgent_EXTENSION_VERSION'
          value: '~3'
        }
        {
          name: 'ConnectionStrings:OracleDb'
          value: 'User Id=SCOTT;Password=tiger;Data Source=//${oracleIp}:1521/XEPDB1'
        }
      ]
    }
    httpsOnly: true
  }
}

