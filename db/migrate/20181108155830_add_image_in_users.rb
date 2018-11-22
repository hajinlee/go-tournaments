class AddImageInUsers < ActiveRecord::Migration[5.2]
  def up
    add_attachment :users, :avatar
  end
end
