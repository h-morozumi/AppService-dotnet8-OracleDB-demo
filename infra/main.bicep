@description('reagion')
param location string
@description('Container Instance Oracle Name [a-z0-9]([-a-z0-9]*[a-z0-9])? e.g. my-name')
param containerName string
@description('App Service Plan Name')
param appServicePlanName string
@description('App Service Name')
param appServiceName string
@description('Application Insights Name')
param appInsightsName string
@description('Log Analytics Workspace Name')
param logAnalyticsName string
@description('use azd up & deploy to set this value')
param tags object

var abbrs = loadJsonContent('./abbreviations.json')
var suffix = uniqueString(resourceGroup().id)

@description('Create Oracle Database')
module oracledb './app/db.bicep' = {
  name: 'oracleDbModule'
  params: {
    location: location
    containerName: '${abbrs.containerInstanceContainerGroups}-${containerName}-${suffix}'
  }
}

@description('Create Web App Service')
module webApp 'app/web.bicep' = {
  name: 'webAppModule'
  params: {
    location: location
    tags: tags
    appServicePlanName: '${abbrs.webSitesAppServiceEnvironment}${appServicePlanName}-${suffix}'
    appServiceName: '${abbrs.webSitesAppService}${appServiceName}-${suffix}'
    appInsightsName: '${abbrs.insightsComponents}${appInsightsName}-${suffix}'
    logAnalyticsName: '${abbrs.operationalInsightsWorkspaces}${logAnalyticsName}-${suffix}'
    oracleIp: oracledb.outputs.containerPublicIp
  }
}
