class UsersController < ApplicationController
  def show
    @user = User.find(current_user.id)
    @tournaments = Tournament.where(author_user_id: @user.id).order(:start_date)
    @tournament_registrations = TournamentRegistration.joins(:tournament).where(user_id: @user.id).where("tournaments.start_date >= ?", Date.today).order("tournaments.start_date")
  end
end
