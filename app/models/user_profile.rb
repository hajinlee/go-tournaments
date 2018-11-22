class UserProfile < ApplicationRecord
  belongs_to :user

  has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/user.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/
  validates_with AttachmentSizeValidator, attributes: :avatar, less_than: 3.megabytes

  validates_uniqueness_of :membership_number, scope: :rating_organization

  # rating_organization:
  AGA = 0
  OTHER = 99

  class << self
    def find_or_create_for(user)
      find_or_create_by(user_id: user.id)
    end
  end

  def image
    avatar.exists? ? avatar.url(:medium) : 'user.png'
  end

  def name
    user.first_name + ' '.html_safe + user.last_name
  end

  def organization
    rating_organization == 0 ? 'American Go Association' + " (##{membership_number.to_s})" : 'Other'
  end
end
