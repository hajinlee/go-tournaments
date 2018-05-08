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

  # NOTE: currently the form encloses parameter names within "tournament[xxx]" in update mode,
  # but does NOT enclose the parameters in create mode.
  # therefore, we have to duplicate the params.permit() logic to extract from the "tournament[]" in
  # the update method, but NOT extract in the create method.

  def create
    @tournament = Tournament.new(sanitize_parameters(params))

    if @tournament.save
      redirect_to @tournament
    else
      render :new
    end
  end

  def update
    @tournament = Tournament.find(params[:id])

    if @tournament.update(sanitize_parameters(params.require(:tournament)))
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

  private
    def tournament_params
      params.require(:tournament).permit(:title, :image, :start_date, :end_date, :venue, :city, :state, :country, :description, :organizer, :contact, :password_digest, :is_rated, :game_rules, :time_setting, :registration_fee, :check_in_begins, :first_round_begins)
    end
    def sanitize_parameters(p)
      p.permit(:title, :image, :start_date, :end_date, :venue, :city, :state, :country, :description, :organizer, :contact, :password_digest, :is_rated, :game_rules, :time_setting, :registration_fee, :check_in_begins, :first_round_begins)
    end
end
