class Registration < ApplicationRecord
  validates :tournament_id, :user_id, presence: true

  belongs_to :tournament
  belongs_to :user
end
