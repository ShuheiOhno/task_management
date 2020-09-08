class CreateJoinProjectUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :join_project_users do |t|

      # ここが怪しい
      t.references :user, foreign_key: true

      # 下は多分だいじょうぶ
      t.references :project, foreign_key: true
      t.timestamps
    end
  end
end
