class CreateReplyUserComments < ActiveRecord::Migration[6.0]
  def change
    create_table :reply_user_comments do |t|
      t.text :reply, null: false
      t.references :user, foreign_key: true, null: false
      t.references :user_comment, foreign_key: true, null: false
      t.timestamps
    end
  end
end
