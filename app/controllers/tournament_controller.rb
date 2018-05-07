class TournamentController < ApplicationController
  def index
    @tournaments = Tournament.all
  end

  def show
    @tournaments = Tournament.find(params[:id])
  end

  def new
    @tournaments = Tournament.new
  end

  def edit
    @tournaments = Tournament.find(params[:id])
  end

  def create
    @tournaments = Tournament.new(tournament_params)

    if @tournaments.save
      redirect_to @tournaments
    else
      render 'new'
    end
  end

  def update
    @tournaments = Tournament.find(params[:id])

    if @tournaments.update(tournament_params)
      redirect_to @tournaments
    else
      render 'edit'
    end
  end

  def destroy
    @tournaments = Tournament.find(params[:id])
    @tournaments.destroy

    redirect_to tournament_path
  end

  private
    def tournament_params
      params.require(:tournament).permit(:tournament, :text)
    end
end
