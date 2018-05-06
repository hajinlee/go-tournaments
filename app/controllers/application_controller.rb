class ApplicationController < ActionController::Base
  def index
    @home = home.all
  end
end
