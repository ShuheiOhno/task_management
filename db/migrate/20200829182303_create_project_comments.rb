class CreateProjectComments < ActiveRecord::Migration[6.0]
  def change
    create_table :project_comments do |t|
      t.references :project, foreign_key: true
      t.references :user, foreign_key: true
      t.string :title, null: false
      t.text :comment, null: false
      # 宛先の人
      t.integer :to_user_id, null: false
      t.timestamps
    end
  end
end
