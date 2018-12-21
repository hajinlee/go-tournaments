class TournamentGame < ApplicationRecord
  validates :tournament_id, :white_id, :black_id, presence: true

  belongs_to :tournament

  def white_player
    User.where(id: white_id).first
  end

  def black_player
    User.where(id: black_id).first
  end
end
