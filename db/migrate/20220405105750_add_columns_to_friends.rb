class AddColumnsToFriends < ActiveRecord::Migration[7.0]
  def change
    add_column :friends, :address, :string
    add_column :friends, :phone_number, :string
  end
end
