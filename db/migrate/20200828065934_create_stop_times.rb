class CreateStopTimes < ActiveRecord::Migration[6.0]
  def change
    create_table :stop_times do |t|
      t.references :task
      t.timestamps
    end
  end
end
