class Reservation < ApplicationRecord
  belongs_to :student
  belongs_to :job
end
