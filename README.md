DB設計

## usersテーブル

|Column|Type|Options|
|------|----|-------|
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
|name|varchar(255)|null: false|

### Association
- has_many :members
- has_many :users, through: :members
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



## membersテーブル

|Column|Type|Options|
|------|----|-------|
|user|references|null: false, foreign_key: true|
|group|references|null: false, foreign_key: true|

### Association
- belongs_to :group
- belongs_to :user
