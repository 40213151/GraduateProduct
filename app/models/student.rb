class Student < ApplicationRecord
  acts_as_mappable 
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  
  has_many :reservations
  has_many :reviews
  
  mount_uploader :image, ImageUploader
  
  def farmer
    return farmer
  end
  
  geocoded_by :place
  after_validation :geocode, :if => :place_changed?
  
  def average_star_rate
    reviews.count == 0 ? 0 : reviews.average(:rate).round(1)
  end

  private
  
   # アップロードされた画像のサイズをバリデーションする
    def image_size
      if image.size > 5.megabytes
        errors.add(:picture, "should be less than 5MB")
      end
    end
end
