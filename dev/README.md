# ローカル開発（実行）用環境手順書

ローカルで.NET 8 アプリケーションを実行するための手順を以下に示します。

## ミドルウェア（Oracle Database）の起動
1. devディレクトリに移動
    ```bash
    cd dev
    ```
2. Oracle Databaseの起動
   ```bash
   docker-compose up -d
   ```

以上で、アプリケーションを動作する準備はできました。

## 解説
DockerでOracle Database XEを起動します。初回のみ、データ投入を実行します。

