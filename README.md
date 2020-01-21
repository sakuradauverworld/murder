# README
マーダーミステリー 口コミサイト マダミス！マダミス！
## Description
マーダーミステリーを紹介するサイトです。
遊んだことがある作品を紹介できたりレビューできたりします。

***DEMO:***
作品紹介
https://gyazo.com/20a299e7d42e081dfaec3f3b01b1b118

レビュー投稿
https://gyazo.com/ed0cec9c8847a1a4b753407db0be0a32

 ## Features

- HAML/SASS記法とBEMの命名規則に基づいたマークアップ
- AWS EC2へのデプロイ
- ActiveStorageを使用しAWS S3への画像アップロード
- pay.jpによる購入処理
- gem-kaminariを使用したページネーション機能
- gem-deviseを使用したログイン機能
- Jqueryでのフロント実装

## Requirement

- Ruby 2.5.1
- Rails 5.2.3

# DB設計

## usersテーブル
|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false|
|email|string|null: false, unique: true|
|password|string|null: false|

### Association
- has_many :reviews
- has_many :posts
  

## postsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|image|string|null: false,|
|user_id|string|null: false|


### Association
- has_many :reviews
- belongs_to :user

## reviewsテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|integer|foreign_key: true, null: false|
|post_id|integer|foreign_key: true, null: false|
|revuew|text|foreign_key: true, null: false|
|rate|integer|foreign_key: true, null: false|

### Association
- belongs_to :user
- belongs_to :post
