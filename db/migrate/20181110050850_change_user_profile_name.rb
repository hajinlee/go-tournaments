class ChangeUserProfileName < ActiveRecord::Migration[5.2]
  def change
    remove_index :user_profiles, :user_id

    rename_table :user_profiles, :user_details
    add_index :user_details, :user_id
  end
end
