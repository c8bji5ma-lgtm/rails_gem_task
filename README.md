# Rails Gem Task

Webエンジニア ステップアップコース（Ruby）で、Gemを使った検索・絞り込み・ソートを学ぶためのTask CRUDアプリです。検索機能などは課題として実装する前提のため、このリポジトリの初期状態には含まれていません。

## Requirements

- Ruby 4.0.5
- Ruby on Rails 8.1.3
- Bundler 4.0.16
- PostgreSQL 18.4
- Node.js 24.18.0
- Yarn 1.22.22

## Setup

PostgreSQLを起動してから、依存関係とデータベースを準備します。

```sh
bundle install
yarn install --frozen-lockfile
bin/rails db:prepare
```

`config/database.yml`は、開発環境ではローカルユーザーで`rails_gem_task_development`へ接続します。接続先を変更する場合は`DATABASE_URL`を指定してください。

## Start the application

```sh
bin/rails server
```

ブラウザで <http://localhost:3000> を開きます。

## Tests and compatibility checks

```sh
bin/rails test
bundle exec rspec
bin/rails zeitwerk:check
RAILS_ENV=test bin/shakapacker
```

ローカルのRSpecにはテストケースがありません。GitHub Actionsではコースの評価用RSpecを`spec/`へ取得して実行します。

本番環境ではデータベース接続用の`RAILS_GEM_TASK_DATABASE_PASSWORD`または`DATABASE_URL`と、Rails credentialsを復号する`RAILS_MASTER_KEY`が必要です。
