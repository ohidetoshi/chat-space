DB設計

## usersテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|email|string|null: false, unique: true|

### Association
- has_many :members
- has_many :groups, through: :members
- has_many :messages

### Add_index
- name



## groupsテーブル

|Column|Type|Options|
|------|----|-------|
|name|string||

### Association
- has_many :group_users
- has_many :users, through: :group_users
- has_many :messages



## messagesテーブル

|Column|Type|Options|
|------|----|-------|
|body|text||
|image|text||
|user|references|null: false, foreign_key: true|
|group|references|null: false, foreign_key: true|

### Association
- belongs_to :group
- belongs_to :user



## group_usersテーブル(中間テーブル)

|Column|Type|Options|
|------|----|-------|
|user|references|null: false, foreign_key: true|
|group|references|null: false, foreign_key: true|

### Association
- belongs_to :group
- belongs_to :user
