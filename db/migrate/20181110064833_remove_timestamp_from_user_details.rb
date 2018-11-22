class RemoveTimestampFromUserDetails < ActiveRecord::Migration[5.2]
  def change
    remove_column :user_details, :created_at
    remove_column :user_details, :updated_at
  end
end
