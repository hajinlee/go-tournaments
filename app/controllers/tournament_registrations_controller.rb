class TournamentRegistrationsController < ApplicationController
  def new
    @tournament_registration = TournamentRegistration.new
    @tournament = Tournament.where(id: params[:tournament_id].to_i).first
  end

  def create
    @tournament_registration = TournamentRegistration.new(tournament_registration_params)

    if @tournament_registration.save
      redirect_back(fallback_location: root_path, notice: 'Registered successfully.')
    end
  end

  def index
    @tournament = Tournament.where(id: params[:tournament_id].to_i).first
    @tournament_registrations = TournamentRegistration.where("tournament_id = ?", @tournament.id)
  end

  def destroy
    @tournament_registration = TournamentRegistration.find(params[:id])
    @tournament_registration.destroy

    redirect_back(fallback_location: root_path)
  end

  private

  def tournament_registration_params
      params[:tournament_registration].permit(:tournament_id, :user_id)
  end
end
