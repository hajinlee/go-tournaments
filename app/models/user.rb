class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :first_name, :last_name, :email, presence: true
  validates_uniqueness_of :aga_number, :allow_nil => true, :allow_blank => true
  validates_uniqueness_of :email
  validates :password, length: { minimum: 8 }
  
  has_many :tournament_registrations, dependent: :destroy
  has_many :tournaments, through: :registrations
  has_many :tournament_admins, dependent: :destroy

  NOT_ADMIN = 0
  SUPER_ADMIN = 1

  def any_admin?
    is_admin == SUPER_ADMIN
  end

  def tournament_admin?(tournament)
    TournamentAdmin.where(user_id: id, tournament_id: tournament.id).any?
  end
end
