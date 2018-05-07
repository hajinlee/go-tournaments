class CreateTournaments < ActiveRecord::Migration[5.2]
  def change
    create_table :tournaments do |t|
      t.integer :tournament_id
      t.string :title
      t.string :image
      t.string :date
      t.string :venue
      t.string :city
      t.string :state
      t.string :organizer
      t.string :contact
      t.timestamps
    end
  end
end
