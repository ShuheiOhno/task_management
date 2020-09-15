class CreateTasks < ActiveRecord::Migration[6.0]
  def change
    create_table :tasks do |t|
      t.string :title
      t.integer :cost_time
      t.integer :estimated_time
      # active_hash
      t.integer :complete_id
      t.references :project, foreign_key: true
      t.references :user, foreign_key:true
      # 宛先
      t.integer :to_user_id
      t.timestamps
    end
  end
end
