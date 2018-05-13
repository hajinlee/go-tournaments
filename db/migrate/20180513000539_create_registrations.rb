class CreateRegistrations < ActiveRecord::Migration[5.2]
  def change
    create_table :registrations do |t|
      t.integer :tournament_id
      t.integer :user_id

      t.index :tournament_id, unique: true
      t.index :user_id, unique: true

      t.timestamps
    end
  end
end
