class JobImage < ApplicationRecord
   belongs_to :job
   attachment :image
end
