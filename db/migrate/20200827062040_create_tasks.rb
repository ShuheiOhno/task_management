class CreateTasks < ActiveRecord::Migration[6.0]
  def change
    create_table :tasks do |t|
      t.string :title, null: false
      t.integer :cost_time
      t.integer :estimated_time
      t.references :project, foreign_key: true
      t.references :user, foreign_key:true
      # 宛先
      t.integer :to_user_id, null: false
      t.timestamps
    end
  end
end
