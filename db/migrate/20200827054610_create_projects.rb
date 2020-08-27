class CreateProjects < ActiveRecord::Migration[6.0]
  def change
    create_table :projects do |t|
      t.string :title
      t.text :explanation
      t.datetime :deadline
      t.references :user, foreign_key: true
      t.integer :complete_id
      t.timestamps
    end
  end
end
