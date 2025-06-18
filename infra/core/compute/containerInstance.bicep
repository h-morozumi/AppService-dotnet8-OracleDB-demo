@description('Container Instance Name')
param conainerName string 
@description('Container Image')
param containerImage string 
@description('Location for the resources')
param location string

@description('Container Instance ')
resource containerGroup 'Microsoft.ContainerInstance/containerGroups@2023-05-01' = {
  name: conainerName
  location: location
  properties: {
    containers: [
      {
        name: conainerName
        properties: {
          image: containerImage
          ports: [
            {
              port: 1521
              protocol: 'TCP'
            }
            {
              port: 5500
              protocol: 'TCP'
            }
          ]
          environmentVariables:[
            {
              name: 'ORACLE_PWD'
              value: 'password'
            }
          ]
          resources: {
            requests: {
              cpu: 2
              memoryInGB: 4
            }
          }
        }
      }
    ]
    osType: 'Linux'
    restartPolicy: 'Never'
    ipAddress: {
      ports: [
        {
          port: 1521
          protocol: 'TCP'
        }
        {
          port: 5500
          protocol: 'TCP'
        }
      ]
      type: 'Public'
    }
  }
}

output containerPublicIp string = containerGroup.properties.ipAddress.ip
