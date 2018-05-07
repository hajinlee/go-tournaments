class UpdateTournament < ActiveRecord::Migration[5.2]
  def change
    change_table :tournaments do |t|
      t.remove :date

      t.text :description
      t.date :start_date
      t.date :end_date
      t.string :country
      t.string :password_digest
      t.string :game_rules
      t.boolean :is_rated
      t.string :registration_fee
      t.string :time_setting
      t.time :check_in_begins
      t.time :first_round_begins
    end
  end
end
