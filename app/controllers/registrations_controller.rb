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

  def show
    @tournament = Tournament.find(params[:id])
    @registration = Registration.where("tournament_id = ?", @tournament.id)
  end

  def destroy
    @registration = Registration.find(params[:id])
    @registration.destroy

    redirect_back(fallback_location: root_path)
  end

  private
    def registration_params
      params[:registration].permit(:tournament_id, :user_id)
    end
end
