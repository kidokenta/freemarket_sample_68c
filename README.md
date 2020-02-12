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
|id|int||
|nickname|string|null: false|
|image|string||
|familyname|string|null: false|
|firstname|string|null: false|
|familyname-kana|string|null: false|
|firstname-kana|string|null: false|
|birthday-y|integer|null: false|
|birthday-m|integer|null: false|
|birthday-d|integer|null: false|
|status|integer||
|deleted_at|integer|datetime|
|postal_code|integer|null: false|
|adress_prefecture|string|null: false|
|status|||
|deleted_at|integer|datetime|
|postal_code|integer|null: false|
|adress_prefecture|string|null: false|
|adress_town|string|null: false|
|adress_number|string|null: false|
|adress_name|string|null: false|
|phonenumber|integer||
|email|||
|password|||
|re-password|||

### Association

## itemsテーブル

|Column|Type|Options|
|------|----|-------|
|id|int||
|item_name|string|null: false|
|images|string|null: false|
|item_explain|string|null: false|
|category_id|integer||
|brand_id|integer||
|status|||
|brand_id|integer||
|brand_id|integer||
|brand_id|integer||
|brand_id|integer||
|brand_id|integer||


* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
>>test2