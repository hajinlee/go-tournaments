class RemovetournamentIdFromTournaments < ActiveRecord::Migration[5.2]
  def change
    remove_column :Tournaments, :tournament_id 
  end
end
