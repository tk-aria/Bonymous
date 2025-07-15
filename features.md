# Docker Compose 設定 - Todo リスト

## 概要
Bonymousプロジェクトを Docker Compose で立ち上げるための設定作業のタスクリストです。

## 高優先度タスク

### 1. 📦 メインDockerfileの作成
- [x] Node.js バックエンドとReactフロントエンドを含むマルチステージビルドのDockerfileを作成
- [x] TypeScriptビルドプロセスの設定
- [x] React アプリケーションのビルドと静的ファイル配信の設定
- [x] アプリケーションポート(4000)の設定

### 2. 🐳 docker-compose.yml の作成
- [x] アプリケーションコンテナの定義
- [x] MongoDB コンテナの設定
- [x] PostgreSQL コンテナの設定（オプション）
- [x] ネットワーク設定とサービス間の通信

### 3. 🔐 環境変数設定ファイルの作成
- [x] .env.example ファイルを作成
- [x] 必要な環境変数をすべて定義:
  - MONGODB_URI（必須）
  - SECRET（必須）
  - DATABASE_TYPE（オプション）
  - GOOGLE OAuth 設定（必須）
  - PostgreSQLConfig（オプション）
  - フロントエンド設定（REACT_APP_TITLE, REACT_APP_DESCRIPTION）

### 4. 🗃️ 永続化ボリュームの設定
- [x] ファイルアップロード用ディレクトリ(/uploads)の永続化
- [x] MongoDB データの永続化
- [x] PostgreSQL データの永続化（使用する場合）
- [x] SQLite データベースファイルの永続化（使用する場合）

### 5. ⚙️ 設定ファイルの環境変数対応
- [x] ハードコードされた設定値を環境変数に変更
- [x] Google OAuth 設定の環境変数化
- [x] データベース接続設定の環境変数化

## 中優先度タスク

### 6. 📂 .dockerignore ファイルの作成
- [x] 不要なファイルをビルドコンテキストから除外
- [x] node_modules、.git、テストファイルなどの除外設定

### 7. 🗄️ データベース初期化スクリプトの作成
- [x] MongoDB の初期化スクリプト
- [x] PostgreSQL の初期化スクリプト
- [x] 必要なデータベースとコレクション/テーブルの作成

### 8. 🔄 開発・本番環境の設定分離
- [ ] docker-compose.yml（本番用）
- [ ] docker-compose.dev.yml（開発用）
- [ ] ホットリロード機能の開発環境での有効化

### 9. 🏥 ヘルスチェックの追加
- [ ] アプリケーションコンテナのヘルスチェック
- [ ] MongoDB コンテナのヘルスチェック
- [ ] PostgreSQL コンテナのヘルスチェック

## 完了済みタスク

### 10. ✅ features.md の作成
- [x] Docker Compose 設定のtodoリストをMarkdown形式で作成

## 技術仕様

### アプリケーション構成
- **バックエンド**: Node.js/Express/TypeScript
- **フロントエンド**: React/TypeScript
- **データベース**: MongoDB（プライマリ）+ SQLite/PostgreSQL（ファイルストレージ）
- **認証**: Google OAuth 2.0
- **ファイルアップロード**: Multer

### 必要なサービス
1. **app**: メインアプリケーション
2. **mongodb**: MongoDB データベース
3. **postgresql**: PostgreSQL データベース（オプション）

### ポート設定
- アプリケーション: 4000（内部）
- MongoDB: 27017（内部）
- PostgreSQL: 5432（内部）

### セキュリティ考慮事項
- Google OAuth 認証情報の適切な管理
- データベース接続のセキュリティ
- ファイルアップロードの検証
- セッション管理の設定