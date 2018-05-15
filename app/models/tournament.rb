class Tournament < ApplicationRecord
  has_attached_file :image, styles: { medium: "400x300", thumb: "150x100"}, default_url: "/images/:style/missing.png"

  validates :title, :start_date, :end_date, :venue, :city, :state, :organizer, :contact, presence: true

  validates_attachment_content_type :image, content_type: ["image/jpeg", "image/gif", "image/png"]
  validates_attachment_file_name :image, matches: [/png\z/, /jpe?g\z/]
  validates_with AttachmentSizeValidator, attributes: :image, less_than: 3.megabytes

  has_many :registrations
  has_many :users, through: :registrations
end
