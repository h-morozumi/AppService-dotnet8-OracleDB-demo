@description('reagion')
param location string
@description('App Service Plan Name')
param appServicePlanName string
@description('App Service Name')
param appServiceName string
@description('Application Insights Name')
param appInsightsName string
@description('Log Analytics Workspace Name')
param logAnalyticsName string
@description('Oracle IP Address')
param oracleIp string

module appServicePlan '../core/web/appservicePlan.bicep' = {
  name: 'appServicePlanModule'
  params: {
    location: location
    appServicePlanName: appServicePlanName
  }
}

module logAnalytics '../core/monitor/logAnalytics.bicep' = {
  name: 'logAnalyticsModule'
  params: {
    location: location
    logAnalyticsName: logAnalyticsName
  }
}

module applicationInsights '../core/monitor/appInsights.bicep' = {
  name: 'applicationInsightsModule'
  params: {
    location: location
    appInsightsName: appInsightsName
    logAnalyticsId: logAnalytics.outputs.logAnalyticsId
  }
}

module appService '../core/web/appservice.bicep' = {
  name: 'appServiceModule'
  params: {
    location: location
    appServiceName: appServiceName
    appServicePlanId: appServicePlan.outputs.appServicePlanId
    appInsightsInstrumentationKey: applicationInsights.outputs.appInsightsInstrumentationKey
    appInsightsConnectionString: applicationInsights.outputs.appInsightsConnectionString
    oracleIp: oracleIp
  }
}
