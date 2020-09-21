このサービスは、プロジェクトと、タスクの管理、情報共有を効率化するものです。自分の担当しているプロジェクト、タスクを確認しやすいこと、完遂率を確認できること、メッセージの送り方を選択できることがポイントです。

基本的には、プロジェクト、メッセージ、タスクの３つのマイページを使っていきます。ページの上部中央から、どのページにいてもアクセスできます。また、プロジェクト、タスクを詳しく確認したい場合は、クリックすると、詳細画面に行けるようになっています。

ちなみに、メッセージの送り方は４種類用意しています。
プロジェクトコメント、タスクコメント、ユーザーメッセージ、チャットです。
状況に応じて、使い分けてください。
詳しい使い方は、以下に記載しています。

使い方
１、新規ユーザー登録/ログインする
２、プロジェクトを作成する（プロジェクトリーダー）
３、タスクを作成する（プロジェクトメンバー全員、もしくはプロジェクトリーダー）
４、タスクを開始するボタンを押して、始める（タスクの担当メンバー）
５、タスクが終了したら、終了ボタンを押しましょう（タスクの担当メンバー）
６、プロジェクトに紐づくタスクが終了したら、プロジェクトの状態を完了にする（プロジェクトリーダー）

ページ説明
３つのマイページ
・プロジェクト
  左:新しいプロジェクトを追加できます。また、リーダーになっている（自身が作成した）プロジェクトを確認できます。
  中央:参加しているプロジェクト、タスクを確認できます。
  右:チャットです。

・メッセージ
  左:プロジェクト、タスクそれぞれのあなた宛のメッセージを確認することができます。
  中央:メッセージを送ることができます。また、受信、送信、返信メッセージを確認することができます。
  右:チャットです。

・タスク
  左:あなたが担当しているタスクの情報を確認できます。完了率など、見ることができます。
  中央:担当しているタスク、コメントを確認することができます。
  右:チャットです。

詳細ページ
・プロジェクト詳細ページ
  左:プロジェクトの詳細を確認できます。また、左下からメンバーの追加、プロジェクトの中止、完了決定をすることができます。
  中央:プロジェクトのコメントを確認できます。
  右:プロジェクトに関するタスクの追加ができます。また、タスクの一覧を見ることができます。

・タスク詳細ページ
  タスクの詳細と、コメントを確認できます。
  また、タスクの編集、削除はここでできます。

・一覧検索ページ
  全てのプロジェクト、タスクを検索することができます。



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
