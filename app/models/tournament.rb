class Tournament < ApplicationRecord
  has_attached_file :image, styles: { medium: "400x300", thumb: "150x100" }, default_url: "/images/:style/alt.png"

  validates :title, :start_date, :end_date, :venue, :city, :state, :organizer, :contact, presence: true

  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
  validates_attachment_file_name :image, matches: [/png\z/, /jpe?g\z/]
  validates_with AttachmentSizeValidator, attributes: :image, less_than: 3.megabytes

  has_many :tournament_registrations, dependent: :destroy
  has_many :users, through: :tournament_registrations
  has_many :tournament_admins, dependent: :destroy

  # game_rules
  AGA_RULES = 0
  JAPANESE_RULES = 1
  KOREAN_RULES = 2
  CHINESE_RULES = 3
  ING_RULES = 4
  OTHER = 99

  # is_rated
  NOT_RATED = 0
  AGA_RATED = 1

  def check_in_at
    check_in_begins.blank? ? 'Unspecified' : check_in_begins.time.strftime("%I:%M %p")
  end

  def first_round_at
    first_round_begins.blank? ? 'Unspecified' : first_round_begins.time.strftime("%I:%M %p")
  end

  def organizers
    # TODO add tournament admins later
    admins = organizer
  end

  def is_admin?(user)
    user.id == author_user_id
  end

  def reg_open?
    start_date > Date.today
  end

  def display_rated
    is_rated ? 'AGA rated' : 'Not rated'
  end

  def display_game_rules
    case game_rules
      when 0
        'AGA rules'
      when 1
        'Japanese rules'
      when 2
        'Korean rules'
      when 3
        'Chinese rules'
      when 4
        'Ing rules'
      when 99
        'Other'
    end
  end
end
