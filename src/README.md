# アプリケーション構築メモ

## プロジェクト作成手順

1. dotnet8 SDKをインストール
    ```powershell
    winget install Microsoft.DotNet.SDK.8
    ```
2. .NET 8 SDKを使用するためのglobal.jsonを作成
    ```powershell
    dotnet new globaljson --sdk-version 8.0.411
    ```
    sdk-versionは、インストールされているバージョンに合わせて変更してください。
    ```
    dotnet --list-sdks
    ```
    ```
    8.0.411 [C:\Program Files\dotnet\sdk]
    9.0.301 [C:\Program Files\dotnet\sdk]
    ```
3. プロジェクトを作成
    ```powershell
    dotnet new mvc -f net8.0 -n MyAspNet8App
    ```
4. デバッグモードで起動
    ```powershell
    cd MyAspNet8App
    dotnet watch run 
    ```
5. Oracleに接続するためのNuGetパッケージをインストール（Oracle.ManagedDataAccessをインストール）
    ```powershell
    # 1) Oracle.ManagedDataAccessをインストール
    dotnet add package Oracle.ManagedDataAccess.Core
    # 2) ORMとしてDapperをインストール
    dotnet add package Dapper
    ```
6. Oracleに接続し、データを主とするようにアプリケーションを修正
7. プロジェクトをSecretsに登録
    ```powershell
    dotnet user-secrets init
    dotnet user-secrets set "ConnectionStrings:OracleDb" "User Id=SCOTT;Password=tiger;Data Source=//localhost:1521/XEPDB1"
    ```
8. デバッグモードで起動
    ```powershell
    dotnet watch run 
    ```
9. Azureにデプロイする場合（前提：Azure環境が構築済み）
    ```
    azd deploy
    ```
