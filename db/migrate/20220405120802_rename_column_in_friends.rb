class RenameColumnInFriends < ActiveRecord::Migration[7.0]
  def change
    rename_column :friends, :dob, :date_of_birth
  end
end
