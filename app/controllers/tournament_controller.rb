class TournamentController < ApplicationController
  def index
    @tournament = Tournament.all
  end
  
  def show
    @tournament = Tournament.find(params[:id])
  end
end
