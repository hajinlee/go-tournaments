class TournamentsController < ApplicationController

  #http_basic_authenticate_with password: :password_digest, except: [:index, :show, :new, :create]

  def index
    @tournaments = Tournament.all
  end

  def show
    @tournament = Tournament.find(params[:id])
  end

  def new
    @tournament = Tournament.new
  end

  def edit
    @tournament = Tournament.find(params[:id])
  end

  # NOTE: currently the form encloses parameter names within "tournament[xxx]" in update mode,
  # but does NOT enclose the parameters in create mode.
  # therefore, we have to duplicate the params.permit() logic to extract from the "tournament[]" in
  # the update method, but NOT extract in the create method.

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

    redirect_to root_path
  end


  private
    def tournament_params
      params[:tournament].permit(:title, :image, :start_date, :end_date, :venue, :city, :state, :country, :description, :organizer, :contact, :password_digest, :is_rated, :game_rules, :time_setting, :registration_fee, :check_in_begins, :first_round_begins)
    end

end