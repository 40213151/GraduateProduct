class Blog < ApplicationRecord
  belongs_to :farmer
  
  mount_uploader :bimage, BimageUploader
  # 必須項目
  validates :blog_title, presence: true
  validates :blog_content, presence: true
  
  private
  
   # アップロードされた画像のサイズをバリデーションする
    def bimage_size
      if bimage.size > 5.megabytes
        errors.add(:picture, "should be less than 5MB")
      end
    end
end
