# タスク2: docker-compose.ymlの作成 - 作業レポート

## 実行内容

### 1. docker-compose.ymlの作成
- アプリケーションコンテナの定義
- MongoDB コンテナの設定
- PostgreSQL コンテナの設定
- ネットワーク設定とサービス間の通信

### 2. 実行したコマンド
```bash
mkdir -p docs/report/docker-compose-yml
```

## 作成したファイル
- `/docker-compose.yml` - Docker Compose設定ファイル

## 設定内容
- **app**: メインアプリケーション (ポート4000)
- **mongodb**: MongoDB データベース (ポート27017)
- **postgresql**: PostgreSQL データベース (ポート5432)
- **volumes**: 永続化ボリューム設定
- **networks**: コンテナ間通信ネットワーク

## 作業結果
✅ docker-compose.ymlの作成が完了しました。

## 次のステップ
次のタスクに進みます：.env.exampleファイルの作成