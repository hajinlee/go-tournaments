class UsersController < ApplicationController
  def show
    @user = User.find(current_user.id)
    @tournament = Tournament.where(author_user_id: @user.id).order(:start_date)
    @registration = Registration.joins(:tournament).where(user_id: @user.id).where("tournaments.start_date >= ?", Date.today).order("tournaments.start_date")
  end
end
