class Job < ApplicationRecord
  belongs_to :farmer
  has_many :reservations
  
  # carry wave
  mount_uploader :jimage, JimageUploader
  
  # 必須項目
  validates :name, presence: true
  validates :price_perhour, presence: true
  validates :place, presence: true
  validates :description, presence: true
  validates :character, presence: true
  
    # descriptonによる絞り込み
  scope :get_by_name, ->(name) {
  where("name like ?", "%#{name}%")
  }
  # placeによる絞り込み
  scope :get_by_place, ->(place) {
  where("place like ?", "%#{place}%")
  }
  # dateによる絞り込み
  scope :get_by_date, ->(date) {
  where("date like ?", "%#{date}%")
  }
  # 時給による絞り込み
  scope :get_by_price_perhour, ->(price_perhour) {
  where("price_perhour like ?", "%#{price_perhour}%")
  }
  
  geocoded_by :place
  after_validation :geocode, :if => :place_changed?
  
  private
  
   # アップロードされた画像のサイズをバリデーションする
    def jimage_size
      if jimage.size > 5.megabytes
        errors.add(:picture, "should be less than 5MB")
      end
    end
  
end
