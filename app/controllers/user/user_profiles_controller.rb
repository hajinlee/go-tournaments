class User::UserProfilesController < ApplicationController
  before_action :set_user_profile

  def show
    @user_profile = UserProfile.find(params[:id])
  end

  def edit
    @user_profile = UserProfile.find(params[:id])
  end

  def update
    if @user_profile.update(user_profile_params)
      redirect_to(user_path, notice: 'Your profile has been updated.')
    else
      alert = @user_profile.errors.any? ? @user_profile.errors.full_messages.join('<br>'.html_safe) : ''
      redirect_to(user_path, alert: alert)
    end
  end

  private

  def set_user_profile
    @user_profile = UserProfile.find(params[:id])
  end

  def user_profile_params
    params[:user_profile].permit(
      :avatar,
      :rating_organization,
      :membership_number,
      :rating,
      :clubs,
      :interested_cities
    )
  end
end
