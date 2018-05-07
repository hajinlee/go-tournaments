class Tournament < ApplicationRecord
  attr_accessible :title, :image, :start_date, :end_date, :venue, :city, :state, :country, :organizer, :contact, :password_digest, :is_rated, :game_rules, :time_setting, :registration_fee, :check_in_begins, :first_round_begins
  has_secure_password
  
end
