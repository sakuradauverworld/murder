# README

## Description


***DEMO:***


 ## Features

- HAML/SASS記法とBEMの命名規則に基づいたマークアップ
- SNS認証に基づく新規登録、ログイン機能
- ajaxを使用した非同期通信
- RSpecを使った単体テスト
- AWS EC2へのデプロイ
- ActiveStorageを使用しAWS S3への画像アップロード
- pay.jpによる購入処理
- グレーテルgemを使用したパンくず機能
- Jqueryによるスライド・モーダル機能

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

## productsテーブル
|Column|Type|Options|
|------|----|-------|
|description|text|null :false|
|name|string|null: false|
|price|integer|null: false|
|delivery_charged|integer|null: false|
|delivery_days|integer|null: false|
|sales_status|integer|null: false|
|delivery_way|ingteger|null: false|
|user_id|integer|foreign_key: true, null: false|
|category_id|integer|foreign_key: true, null: false|
|brand|string|
|status_id|integer|foreign_key: true, default: 1|
|size_id||integer||foreign_key: true|
|prefecture_id|integer|null:false|

### Association
- belongs_to :user
- belongs_to :category
- belongs_to :status
- belongs_to :size
- belongs_to_active_hash :prefecture
- has_many :images, dependent: :destroy
- has_one :history, dependent: :destroy

## imagesテーブル
|Column|Type|Options|
|------|----|-------|
|image|string|null: false|
|product_id|integer|foreign_key: true, null: false|

### Association
- belongs_to :product

## statusesテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|

### Association
- has_many :products

## sizesテーブル
|Column|Type|Options|
|------|----|-------|
|size_name|string|null: false|

### Association
- has_many :products
- belongs_to :catefory

## categoriesテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|ancestry|string|foreign_key: true, null: false|

### Association
- has_many :products
- has_many :sizes

## sns_credentialsテーブル
|Column|Type|Options|
|------|----|-------|
|provider|string|
|uid|string||
|user_id|integer|

### Association
- belongs_to :user
