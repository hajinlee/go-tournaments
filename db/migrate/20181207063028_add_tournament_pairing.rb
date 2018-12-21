class AddTournamentPairing < ActiveRecord::Migration[5.2]
  def change
    add_column :tournament_registrations, :checked_in, :boolean

    create_table "tournament_games" do |t|
      t.integer "tournament_id"
      t.integer "white_id"
      t.integer "black_id"
      t.integer "round_number"
      t.integer "result"
    end

    add_index :tournament_games, ["tournament_id"], name: "index_tournament_games_on_tournament_id", using: :btree

    create_table "tournament_player_scores" do |t|
      t.integer "tournament_id"
      t.integer "round_number"
      t.integer "user_id"
      t.integer "mms"
      t.integer "wins"
      t.integer "sos"
      t.integer "sosos"
    end

    add_index :tournament_player_scores, ["tournament_id"], name: "index_tournament_player_scores_on_tournament_id", using: :btree
    add_index :tournament_player_scores, ["user_id"], name: "index_tournament_player_scores_on_user_id", using: :btree
  end
end
