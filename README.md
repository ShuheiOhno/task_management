# README


## usersテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false, uniqueness: true|
|email|string|null: false, unique: true|
|password|string|null: false, unique: true|

### association
- has_many :tasks, dependent: :destroy
- has_many :projects,through: :join_project_users ,dependent: :destroy
- has_many :project_comments, dependent: :destroy
- has_many :task_comments, dependent: :destroy
- has_many :user_comments, dependent: :destroy
- has_many :reply_user_comments, dependent: :destroy
- has_one :comment


## projectsテーブル
|Column|Type|Options|
|------|----|-------|
|title|string|null: false|
|explanation|text|null: false|
|deadline|datetime|null: false|
|user_id|references|foreign_key: true, null: false|
|complete_id|integer|

### association
- has_many :tasks, dependent: :destroy
- has_many :project_comments, dependent: :destroy
- has_many :join_project_users, dependent: :destroy
- has_many :users,through: :join_project_users , dependent: :destroy
- belongs_to_active_hash :complete


## tasks
|Column|Type|Options|
|------|----|-------|
|title|string|null: false|
|estimated_time|integer|
|project_id|references|foreign_key: true|
|user_id|references|foreign_key: true|
|to_user_id|integer|null: false|

### association
- belongs_to :user
- belongs_to :project
- has_one :start_time, dependent: :destroy
- has_one :stop_time, dependent: :destroy
- has_many :task_comment, dependent: :destroy



## start_timesテーブル

|Column|Type|Options|
|------|----|-------|
|task_id|references|null: false, foreign_key: true|

### association
- belongs_to :task, optional: true


## stop_timesテーブル

|Column|Type|Options|
|------|----|-------|
|task_id|references|null: false, foreign_key: true|

### association
- belongs_to :task, optional: true


## project_commentsテーブル
|Column|Type|Options|
|------|----|-------|
|title|string|null: false|
|comment|text|null: false|
|project_id|references|null: false, foreign_key: true|
|user_id|references|null: false, foreign_key: true|
|to_user_id|integer|null: false|

### association
- belongs_to :project, optional: true
- belongs_to :user, optional: true


## user_commentsテーブル
|Column|Type|Options|
|------|----|-------|
|title|string|null: false|
|comment|text|null: false|
|user_id|references|null: false, foreign_key: true|
|to_user_id|integer|null: false|

### association
- belongs_to :user, optional: true
- has_many :reply_user_comments, dependent: :destroy


## task_commentsテーブル 
|Column|Type|Options|
|------|----|-------|
|title|string|null: false|
|comment|text|null: false|
|task_id|references|null: false, foreign_key: true|
|user_id|references|null: false, foreign_key: true|
|to_user_id|integer|null: false|

### association
- belongs_to :task, optional: true
- belongs_to :user, optional: true


## join_project_usersテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false, foreign_key: true|
|project_id|references|null: false, foreign_key: true|

### association

- has_many :items
- has_ancestry


## reply_user_commentsテーブル
|Column|Type|Options|
|------|----|-------|
|reply|text|null: false|
|user_id|references|null: false, foreign_key: true|
|user_comment_id|references|null: false, foreign_key: true|

### association
- belongs_to :user
- belongs_to :user_comment


## commentsテーブル
|Column|Type|Options|
|------|----|-------|
|content|text|
|image|string|
|user_id|references|null: false, foreign_key: true|

### association
- belongs_to :user





-------------------------
- gem active hash
