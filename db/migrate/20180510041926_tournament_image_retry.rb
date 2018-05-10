class TournamentImageRetry < ActiveRecord::Migration[5.2]
  def change
    change_table :tournaments do |t|
      t.remove :image

      t.attachment :image
    end
  end
end
