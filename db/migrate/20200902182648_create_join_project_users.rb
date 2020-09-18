class CreateJoinProjectUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :join_project_users do |t|

      t.references :user, foreign_key: true, null: false
      t.references :project, foreign_key: true, null: false
      t.timestamps
    end
  end
end
