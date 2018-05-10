class TournamentsImage < ActiveRecord::Migration[5.2]
  def change
    change_column :tournaments, :image, :attachment
      
  end
end
