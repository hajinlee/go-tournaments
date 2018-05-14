class RegistrationsController < ApplicationController
  def new
    @registration = Registration.new
  end

  def create
    @registration = Registration.new(registration_params)

    if @registration.save
      redirect_back(fallback_location: root_path)
    end
  end

  private
    def registration_params
      params[:registration].permit(:tournament_id, :user_id)
    end
end
