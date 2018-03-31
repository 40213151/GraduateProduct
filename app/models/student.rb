class Student < ApplicationRecord
  acts_as_mappable 
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :reservations
  
  def farmer
    return farmer
  end
  
  has_attached_file :image, styles: { medium: "400x400>", thumb: "100x100>" }, default_url: "avatar_default.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
  
  accepts_attachments_for :student_images, attachment: :image
  
  geocoded_by :place
  after_validation :geocode, :if => :place_changed?
end
