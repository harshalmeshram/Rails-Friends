class AddDobToFriends < ActiveRecord::Migration[7.0]
  def change
    add_column :friends, :dob, :date 
    add_column :friends, :age, :integer
  end
end
