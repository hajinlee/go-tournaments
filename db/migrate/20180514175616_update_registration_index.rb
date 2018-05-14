class UpdateRegistrationIndex < ActiveRecord::Migration[5.2]
  def change
    remove_index :registrations, :tournament_id
    remove_index :registrations, :user_id

    add_index :registrations, [:tournament_id, :user_id], unique: true
    add_index :registrations, :user_id, unique: false
  end
end
