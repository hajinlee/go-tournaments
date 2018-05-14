class Registration < ApplicationRecord
  validates :tournament_id, :user_id, presence: true
end
