class CreateUserComments < ActiveRecord::Migration[6.0]
  def change
    create_table :user_comments do |t|
      t.references :user, foreign_key: true
      t.string :title
      t.text :comment
      # 宛先の人
      t.integer :to_user_id
      t.timestamps
    end
  end
end
