param location string 
param oracleHost string

resource initScript 'Microsoft.Resources/deploymentScripts@2023-08-01' = {
  name: 'oracle-init-script'
  location: location
  kind: 'AzureCLI'
  properties: {
    azCliVersion: '2.73.0'
    scriptContent: '''
      tdnf install unzip libaio -y
      tdnf install sed -y

      curl -O https://download.oracle.com/otn_software/linux/instantclient/2380000/instantclient-basic-linux.x64-23.8.0.25.04.zip
      curl -O https://download.oracle.com/otn_software/linux/instantclient/2380000/instantclient-sqlplus-linux.x64-23.8.0.25.04.zip
      unzip instantclient-basic-linux.x64-23.8.0.25.04.zip -d /opt
      unzip -o instantclient-sqlplus-linux.x64-23.8.0.25.04.zip -d /opt

      export LD_LIBRARY_PATH=/opt/instantclient_23_8
      export PATH=$LD_LIBRARY_PATH:$PATH

      curl -L -o test.sql https://gist.githubusercontent.com/h-morozumi/62fe7611f5043ec9ad8ddc476779be2b/raw/f0db4a7dd4674b53fd8e2ca3af9837b628b3c4d1/scott.sql
      sed "s|\${oracleHost}|$ORACLE_IP|g" test.sql > test_resolved.sql

      sqlplus SYSTEM/password@$ORACLE_IP:1521/XEPDB1 @test_resolved.sql

    '''
    timeout: 'PT15M'
    cleanupPreference: 'OnSuccess'
    retentionInterval: 'P1D'
    forceUpdateTag: 'v1'
    environmentVariables: [
      {
        name: 'ORACLE_HOME'
        value: '/opt/instantclient_23_8'
      }
      {
        name: 'ORACLE_IP'
        value: oracleHost
      }
    ]
  }
}
