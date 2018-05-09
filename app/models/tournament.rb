class Tournament < ApplicationRecord
  validates :title, presence: true,
                    length: { minimum: 5 }
  #add dates
end
