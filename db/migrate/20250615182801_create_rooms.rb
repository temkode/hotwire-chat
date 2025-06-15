class CreateRooms < ActiveRecord::Migration[8.0]
  def change
    create_table :rooms do |t|
      t.string :name, null: false
      t.text :description

      t.timestamps
    end

    add_index :rooms, :name, unique: true
  end
end
