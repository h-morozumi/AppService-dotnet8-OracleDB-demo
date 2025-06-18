# AppService-dotnet8-OracleDB-demo

## 概要
Azure App Service (Windows) 上で、.NET 8 アプリケーションと Oracle Database を使用するデモアプリケーションです。

## 前提条件
- Azure サブスクリプションを持っていること
- Azure CLI がインストールされていること
    - [Azure CLI をインストールする方法 | Microsoft Learn](https://learn.microsoft.com/ja-jp/cli/azure/install-azure-cli?view=azure-cli-latest) 
- Azure Developer CLI  がインストールされていること
    - [Azure Developer CLI をインストールする | Microsoft Learn](https://learn.microsoft.com/ja-jp/azure/developer/azure-developer-cli/install-azd?tabs=winget-windows%2Cbrew-mac%2Cscript-linux&pivots=os-windows) 
- Docker がインストールされていること
    - [Install Docker Desktop on Windows](https://docs.docker.com/desktop/setup/install/windows-install/) 
- .NET SDK 8 がインストールされていること
    - [Install the .NET SDK (Linux, macOS, and Windows) - .NET](https://learn.microsoft.com/ja-jp/dotnet/core/install/)
    - [.NET のダウンロード (Linux、macOS、Windows) | .NET](https://dotnet.microsoft.com/ja-jp/download)


## Azureへのデプロイ

1. リポジトリをチェックアウト
    ```bash
    git clone https://github.com/hmorozumi/AppService-dotnet8-OracleDB-demo.git
    cd AppService-dotnet8-OracleDB-demo
    ```
2. Azure CLI でログイン
    ```bash
    az login
    ```
3. Azure Developer CLI でログイン
    ```bash
    azd login
    ```
4. Azure Developer CLI でプロジェクトを初期化
    ```bash
    azd init
    ```
5. Azure Developer CLI で環境を作成
    ```bash
    azd env new
    ```
6. Azure Developer CLI でインフラをデプロイ
    ```bash
    azd up
    ```
7. 環境の削除
    ```bash
    azd down
    ```

