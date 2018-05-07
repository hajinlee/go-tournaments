class CreateTournaments < ActiveRecord::Migration[5.2]
  def change
    create_table :tournaments do |t|
      t.primary_key :tournament_id
      t.string :title, :null => false
      t.binary :image
      t.date :start_date, :null => false
      t.date :end_date
      t.string :venue, :null => false
      t.string :city
      t.string :state
      t.string :country
      t.string :organizer
      t.string :contact
      t.string :password_digest
      t.string :game_rules
      t.boolean :is_rated
      t.string :registration_fee
      t.string :time_setting
      t.time :check_in_begins
      t.time :first_round_begins
      t.timestamps
    end
  end
end
