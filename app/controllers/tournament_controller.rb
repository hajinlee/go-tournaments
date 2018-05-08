class TournamentController < ApplicationController

  #http_basic_authenticate_with password: :password_digest, except: [:index, :show, :new, :create]

  def index
    @tournaments = Tournament.all
  end

  def show
    @tournament = Tournament.find(params[:id])
  end

  def new
    @tournaments = Tournament.new
  end

  def edit
    @tournament = Tournament.find(params[:id])
  end

  def create
    @tournament = Tournament.new(tournament_params)

    if @tournament.save
      redirect_to @tournament
    else
      render :new
    end
  end

  def update
    @tournament = Tournament.find(params[:id])

    if @tournament.update(tournament_params)
      redirect_to @tournament
    else
      render :edit
    end
  end

  def destroy
    @tournament = Tournament.find(params[:id])
    @tournament.destroy

    redirect_to tournament_path
  end

  def show_image
    @tournament = Tournament.find(params[:id])
    send_data @tournament.image, :type => 'image/png', :disposition => 'inline'
  end

  private
    def tournament_params
      params.permit(:title, :image, :start_date, :end_date, :venue, :city, :state, :country, :description, :organizer, :contact, :password_digest, :is_rated, :game_rules, :time_setting, :registration_fee, :check_in_begins, :first_round_begins)
    end
end
