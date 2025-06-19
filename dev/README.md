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

## DBへの接続確認方法

1. OracleのContainerIDを確認
   ```bash
   docker ps
   ```
2. Oracleに接続
   ```bash
   docker exec -it <container_id> /bin/bash
   ```
3. SQL*Plusを起動
    ```bash
    sqlplus SCOTT/tiger@XEPDB1
   ```
4. テーブルの確認
   ```sql
    SELECT EMPNO, ENAME FROM EMP;
   ```
5. 管理者でログインする方法
   ```sql
   sqlplus SYSTEM/password@XEPDB1
   ```
