class ChangeColumnInUserDetails < ActiveRecord::Migration[5.2]
  def change
    remove_index :user_details, :user_id
    remove_column :user_details, :association

    rename_table :user_details, :user_profiles
    add_column :user_profiles, :rating_organization, :integer
    add_index :user_profiles, :user_id
  end
end
