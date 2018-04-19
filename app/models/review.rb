class Review < ApplicationRecord
  belongs_to :farmer
  belongs_to :student
end
