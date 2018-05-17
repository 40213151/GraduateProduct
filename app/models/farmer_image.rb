class FarmerImage < ApplicationRecord
  belongs_to :farmer
  attachment :image
end