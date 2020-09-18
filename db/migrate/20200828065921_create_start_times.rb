class CreateStartTimes < ActiveRecord::Migration[6.0]
  def change
    create_table :start_times do |t|
      t.references :task, foreign_key: true
      t.timestamps
    end
  end
end
