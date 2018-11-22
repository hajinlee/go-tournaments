class AddUserProfileTable < ActiveRecord::Migration[5.2]
  def change
    create_table :user_profiles do |t|
      t.integer :user_id
      t.attachment :avatar
      t.integer :association
      t.integer :membership_number
      t.float :rating
      t.text :clubs
      t.text :interested_cities

      t.index :user_id, unique: true
      t.timestamps
    end

    remove_column :users, :avatar
  end
end
