class Student < ApplicationRecord
  acts_as_mappable 
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  
  has_many :reservations
  has_many :reviews
  
  mount_uploader :image, ImagesUploader
  
  def farmer
    return farmer
  end
  
  has_attached_file :image, styles: { medium: "400x400>", thumb: "100x100>" }, default_url: "avatar_default.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
  
  geocoded_by :place
  after_validation :geocode, :if => :place_changed?
  
  def average_star_rate
    reviews.count == 0 ? 0 : reviews.average(:rate).round(1)
  end
end
