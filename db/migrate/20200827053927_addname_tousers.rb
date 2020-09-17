class AddnameTousers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :name, :string, null: false, uniqueness: true
  end
end
