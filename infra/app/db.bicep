@description('Region for resources')
param location string
@description('Oracle Database Express Edition Container Image')
param containerImage string = 'container-registry.oracle.com/database/express:latest'
@description('Container Instance Name')
param conainerName string

@description('Create Oracle Database Container Instance')
module containerInstance '../core/compute/containerInstance.bicep' = {
  name: 'containerInstanceModule'
  params: {
    conainerName: conainerName
    containerImage: containerImage
    location: location
  }
}

@description('Oracle DB initialization script')
module oracleInitScript '../core/database/oracle/oracleScript.bicep' = {
  name: 'oracleInitScriptModule'
  params: {
    location: location
    oracleHost: containerInstance.outputs.containerPublicIp
  }
}

output containerPublicIp string = containerInstance.outputs.containerPublicIp
