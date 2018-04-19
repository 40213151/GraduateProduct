class Blog < ApplicationRecord
  belongs_to :farmer
  
  has_many :blog_images, dependent: :destroy
  accepts_attachments_for :blog_images, attachment: :image
  # 必須項目
  validates :blog_title, presence: true
  validates :blog_content, presence: true
end
