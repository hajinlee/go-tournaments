class TournamentRegistration < ApplicationRecord
  validates :tournament_id, :user_id, presence: true

  belongs_to :tournament
  belongs_to :user

  def user
    User.where(id: user_id).first
  end

  def registered_date
    Time.at(created_at).strftime("%B %e, %Y")
  end
end
