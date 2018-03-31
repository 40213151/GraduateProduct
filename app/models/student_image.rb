class StudentImage < ApplicationRecord
     belongs_to :student
     attachment :image
end
