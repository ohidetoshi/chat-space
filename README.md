# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...


## usersテーブル

|Column|Type|Options|
|------|----|-------|
|id|integer|null: false, primary_key: true|
|name|varchar(255)|null: false|
|email|varchar(255)|null: false|
|timestamp|integer|null: false|

### Association
- has_many :groups
- has_many :messages



## groupsテーブル

|Column|Type|Options|
|------|----|-------|
|id|integer|null: false, primary_key: true|
|groupname|varchar(255)|null: false|
|timestamp|integer|null: false|


### Association
- has_many :users
- has_many :messages



## messagesテーブル

|Column|Type|Options|
|------|----|-------|
|id|integer|null: false, primary_key: true|
|body|text|null: false|
|image|text|null: true|
|group_id|integer|null: false, foreign_key: true|
|user_id|integer|null: false, foreign_key: true|
|timestamp|integer|null: false|

### Association
- belongs_to :group
- belongs_to :user



## membersテーブル

|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false, foreign_key: true|
|group_id|integer|null: false, foreign_key: true|

### Association
- belongs_to :group
- belongs_to :user
