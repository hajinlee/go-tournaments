class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :first_name, :last_name, :email, presence: true
  validates_uniqueness_of :email
  validates :password, length: { minimum: 8 }

  after_create :create_user_profile

  has_many :tournament_registrations, dependent: :destroy
  has_many :tournaments, through: :registrations
  has_many :tournament_admins, dependent: :destroy
  has_one :user_profile, dependent: :destroy

  accepts_nested_attributes_for :user_profile

  NOT_ADMIN = 0
  SUPER_ADMIN = 1
  TOURNAMENT_ADMIN = 2

  def create_user_profile
    UserProfile.find_or_create_for(self)
  end

  def any_admin?
    is_admin == (SUPER_ADMIN || TOURNAMENT_ADMIN)
  end

  def tournament_admin?(tournament)
    TournamentAdmin.where(user_id: id, tournament_id: tournament.id).any?
  end

  def get_image
    self.user_profile.image
  end

  def name
    first_name + ' '.html_safe + last_name
  end

  def needs_aga?(tournament)
    tournament.is_rated? && self.user_profile.membership_number.blank?
  end

  def rating
    self.user_profile.rating
  end

  def club
    self.user_profile.clubs
  end
end
