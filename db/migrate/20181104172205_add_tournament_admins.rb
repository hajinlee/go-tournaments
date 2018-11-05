class AddTournamentAdmins < ActiveRecord::Migration[5.2]
  def change
    create_table "tournament_admins", id: false do |t|
      t.integer "tournament_id"
      t.integer "user_id"
    end

    add_index :tournament_admins, ["tournament_id"], name: "index_tournament_admins_on_tournament_id", using: :btree
    add_index :tournament_admins, ["user_id"], name: "index_tournament_admins_on_user_id", using: :btree

    # Add admin column in users table
    add_column :users, :is_admin, :integer, default: false

    # Rename registrations
    remove_index :registrations, {name: :index_registrations_on_tournament_id_and_user_id, unique: true}
    remove_index :registrations, {name: :index_registrations_on_user_id}
    rename_table :registrations, :tournament_registrations

    add_index :tournament_registrations, ["tournament_id"], name: "index_tournament_registrations_on_tournament_id", using: :btree
    add_index :tournament_registrations, ["user_id"], name: "index_tournament_registrations_on_user_id", using: :btree
  end
end
