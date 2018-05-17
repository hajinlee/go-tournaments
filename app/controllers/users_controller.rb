class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @tournament = Tournament.where("author_user_id = ?", @user.id).order("start_date")
    @registration = Registration.where("user_id = ?", @user.id)
  end
end
