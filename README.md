# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation
## usersテーブル

|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false, unique: true, index:true|
|image|string||
|familyname|string|null: false|
|firstname|string|null: false|
|familyname-kana|string|null: false|
|firstname-kana|string|null: false|
|birthday|date|null: false|
|status|integer||
|postal_code|integer|null: false|
|adress_prefecture|string|null: false|
|status|||
|deleted_at|integer|datetime|
|postal_code|integer|null: false|
|adress_prefecture|string|null: false|
|adress_town|string|null: false|
|adress_number|string|null: false|
|adress_name|string||
|phonenumber|integer||
|email|string|null: false, unique: true|
|password|string|null: false, unique: true|
|re-password|string|null: false, unique: true|
|buy-item|reference|foreign_key: true|
|sell-item|reference|foreign_key: true|

### Association
has_many :items
has_many :likes

## itemsテーブル

|Column|Type|Options|
|------|----|-------|
|item_name|string|null: false|
|images|string|null: false|
|item_explain|string|null: false|
|category_id|integer||
|brand_id|integer||
|status|integer|null: false|
|condition|integer|null: false|
|shipping_fee|integer|null: false|
|shipping_days|integer|null: false|
|shipping_company|integer|null: false|
|shipping_region|string|null: false|
|price|integer|null: false|
|seller_user|reference|null: false, foreign_key: true|
|buyer_user|reference|null: false, foreign_key: true|
|category|reference|null: false, foreign_key: true|
|brand|reference|foreign_key: true|

### Association
belongs_to :user
has_many :categories
has_many :brands
has_many :likes

## brands テーブル
|Column|Type|Options|
|------|----|-------|
|id|int||
|brand_name|string|null: false|
|item|reference|null: false, foreign_key: true|
 
### Association
belongs_to :item

## categories テーブル
|Column|Type|Options|
|------|----|-------|
|category_name|string|null: false|
|item|reference|null: false, foreign_key: true|

### Association
belongs_to :item

## likes テーブル
|Column|Type|Options|
|------|----|-------|
|user|reference|null: false, foreign_key: true|
|item|reference|null: false, foreign_key: true|

### Association
belongs_to :user
belongs_to :item

## ordersテーブル
|Column|Type|Options|
|------|----|-------|
|item|reference|null: false, foreign_key: true|
|buyer_user|reference|null: false, foreign_key: true|

### Association


## commentsテーブル
|Column|Type|Options|
|------|----|-------|
|text|integer|null: false|
|item|reference|null: false, foreign_key: true|
|user|reference|null: false, foreign_key: true|

### Association









* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...