DB設計

## usersテーブル

|Column|Type|Options|
|------|----|-------|
|id|integer|null: false|
|name|varchar(255)|null: false|
|email|varchar(255)|null: false, unique: true|

### Association
- has_many :members
- has_many :groups, through: :members
- has_many :messages

### Add_index
- name



## groupsテーブル

|Column|Type|Options|
|------|----|-------|
|id|integer|null: false|
|name|varchar(255)|null: false|

### Association
- has_many :members
- has_many :users, through: :members
- has_many :messages



## messagesテーブル

|Column|Type|Options|
|------|----|-------|
|id|integer|null: false|
|body|text|null: false|
|image|text|null: true|
|user_id|references|null: false, foreign_key: true|
|group_id|references|null: false, foreign_key: true|

### Association
- belongs_to :group
- belongs_to :user



## membersテーブル

|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false, foreign_key: true|
|group_id|references|null: false, foreign_key: true|

### Association
- belongs_to :group
- belongs_to :user
