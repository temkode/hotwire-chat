class AddFieldsToUsers < ActiveRecord::Migration[8.0]
  def change
    add_column :users, :first_name, :string, null: false
    add_column :users, :last_name, :string
    add_column :users, :username, :string,  null: false
  end
end
