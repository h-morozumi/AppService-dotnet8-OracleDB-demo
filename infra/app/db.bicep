@description('Region for resources')
param location string
@description('Oracle Database Express Edition Container Image')
param containerImage string = 'container-registry.oracle.com/database/express:latest'
@description('Container Instance Name')
param containerName string

@description('Create Oracle Database Container Instance')
module containerInstance '../core/compute/containerInstance.bicep' = {
  name: 'containerInstanceModule'
  params: {
    containerName: containerName
    containerImage: containerImage
    location: location
    cpu: 2
    memoryInGB: 4
    restartPolicy: 'Never'
    ports: [
      { port: 1521, protocol: 'TCP' }
      { port: 5500, protocol: 'TCP' }
    ]
    environmentVariables: [
      { name: 'ORACLE_PWD', value: 'password' }
    ]
  }
}

@description('Oracle DB initialization script')
module oracleInitScript './oracleScript.bicep' = {
  name: 'oracleInitScriptModule'
  params: {
    location: location
    oracleHost: containerInstance.outputs.containerPublicIp
  }
}

output containerPublicIp string = containerInstance.outputs.containerPublicIp
