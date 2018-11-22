class ChangeRatingToString < ActiveRecord::Migration[5.2]
  def change
    change_column :user_profiles, :rating, :string
  end
end
