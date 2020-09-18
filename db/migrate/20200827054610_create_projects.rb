class CreateProjects < ActiveRecord::Migration[6.0]
  def change
    create_table :projects do |t|
      t.string :title, null: false
      t.text :explanation, null: false
      t.datetime :deadline, null: false
      t.references :user, foreign_key: true, null: false
      t.integer :complete_id
      t.timestamps
    end
  end
end
