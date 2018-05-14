class UpdateTournamentWithAuthor < ActiveRecord::Migration[5.2]
  def change
    remove_column :Tournaments, :password_digest

    add_column :Tournaments, :author_user_id, :integer 
  end
end
