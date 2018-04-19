class Farmer < ApplicationRecord
  acts_as_mappable 
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable
         
    has_many :jobs
    has_many :reviews
    has_many :blogs
    
    has_attached_file :image, styles: { medium: "400x400>", thumb: "100x100>" }, default_url: "avatar_default.png"
    validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
    
    def self.from_omniauth(auth)
      where(provider: auth.provider, uid: auth.uid).first_or_create do |farmer|
        farmer.email = auth.info.email
        farmer.password = Devise.friendly_token[0,20]
        farmer.name = auth.info.name   # assuming the farmer model has a name
        farmer.image = "http://graph.facebook.com/#{auth.uid}/picture?type=large" # assuming the farmer model has an image
        # If you are using confirmable and the provider(s) you use validate emails, 
        # uncomment the line below to skip the confirmation emails.
        # farmer.skip_confirmation!
      end
    end
    
    geocoded_by :place
    after_validation :geocode, :if => :place_changed?
end
