class AddReferenceToUserDetails < ActiveRecord::Migration[5.2]
  def change
    remove_column :user_details, :user_id
    add_reference :user_details, :user
  end
end
