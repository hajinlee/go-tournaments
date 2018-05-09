class StaticPagesController < ApplicationController
  def index
    @tournaments = Tournament.where('start_date > ?', Date.today).order('start_date')
  end
end
