class ChangeTournamentCloumns < ActiveRecord::Migration[5.2]
  def change
    change_column :tournaments, :game_rules, :integer
    change_column :tournaments, :is_rated, :integer
  end
end
