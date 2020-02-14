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
|adress_prefecture|string|null: false|
|status|||
|deleted_at|integer|datetime|
|phonenumber|integer||
|email|string|null: false, unique: true|
|password|string|null: false, unique: true|
|re-password|string|null: false, unique: true|
|buy-item|reference|foreign_key: true|
|sell-item|reference|foreign_key: true|
|order|reference|foreign_key: true|
|comment|reference|foreign_key :true|

### Association
has_many :items　
has_many :likes
has_one :adresses
has_many :orders
has_many :comments

## addressesテーブル

|Column|Type|Options|
|------|----|-------|
|postal_code|integer|null: false|
|prefecture|string|null: false|
|town|string|null: false|
|number|string|null: false|
|name|string||

### Association
belongs_to :user


## itemsテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|item_explain|string|null: false|
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
|order|reference|foreign_key: true|
|comment|reference|foreign_key :true|
### Association
belongs_to :user dependent: :destroy
belongs_to :category
belongs_to :brands
has_many :likes
has_many :images
has_many :orders
has_many :comments

## imagesテーブル
|Column|Type|Options|
|------|----|-------|
|image|string|null: false|
|item|reference|foreign_key :true|
### Association
belongs_to :item dependent: :destroy


## brands テーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|item|reference|null: false, foreign_key: true|
 
### Association
belongs_to :item

## categories テーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|ancestry|string|null: false|

### Association
has_many :item

## likes テーブル
|Column|Type|Options|
|------|----|-------|
|user|reference|null: false, foreign_key: true|
|item|reference|null: false, foreign_key: true|

### Association
belongs_to :user dependent: :destroy
belongs_to :item dependent: :destroy

## ordersテーブル
|Column|Type|Options|
|------|----|-------|
|item|reference|null: false, foreign_key: true|
|buyer_user|reference|null: false, foreign_key: true|

### Association
belongs_to :item dependent: :destroy
belongs_to :user dependent: :destroy


## commentsテーブル
|Column|Type|Options|
|------|----|-------|
|text|string|null: false|
|item|reference|null: false, foreign_key: true|
|user|reference|null: false, foreign_key: true|

### Association

belongs_to :item dependent: :destroy
belongs_to :user









* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...