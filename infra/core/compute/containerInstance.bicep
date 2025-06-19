@description('Container Instance Name')
param containerName string

@description('Container Image (e.g., hmorozumi/oraclexe:1.0)')
param containerImage string

@description('Location for the resources')
param location string

@description('CPU cores requested')
@minValue(1)
param cpu int = 1

@description('Memory in GB requested')
@minValue(1)
param memoryInGB int = 2

@description('Port mappings')
param ports array = [
  {
    port: 80
    protocol: 'TCP'
  }
]

@description('Environment variables')
param environmentVariables array = []

@description('Restart policy: Always, OnFailure, Never')
@allowed([
  'Always'
  'OnFailure'
  'Never'
])
param restartPolicy string = 'OnFailure'

resource containerGroup 'Microsoft.ContainerInstance/containerGroups@2023-05-01' = {
  name: containerName
  location: location
  properties: {
    osType: 'Linux'
    restartPolicy: restartPolicy
    containers: [
      {
        name: containerName
        properties: {
          image: containerImage
          resources: {
            requests: {
              cpu: cpu
              memoryInGB: memoryInGB
            }
          }
          ports: ports
          environmentVariables: environmentVariables
        }
      }
    ]
    ipAddress: {
      type: 'Public'
      ports: ports
    }
  }
}

output containerPublicIp string = containerGroup.properties.ipAddress.ip
