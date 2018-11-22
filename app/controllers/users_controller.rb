class UsersController < ApplicationController
  def show
    @user = User.find(current_user.id)
    @tournaments = Tournament.where(author_user_id: @user.id).order(:start_date)
    @tournament_registrations = TournamentRegistration.joins(:tournament).where(user_id: @user.id).where("tournaments.start_date >= ?", Date.today).order("tournaments.start_date")
    @user_profile = @user.user_profile
  end

  def update
    @user = User.find(params[:id])

    if @user.update(user_params)
      redirect_to @user
    else
      render :edit
    end
  end


  private

  def user_params
    params[:user].permit(
      :first_name,
      :last_name,
      :aga_number,
      :email,
      :password,
      :password_confirmation,
      :avatar
    )
  end
end
