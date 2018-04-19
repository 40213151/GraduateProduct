class Mail < ApplicationRecord
  belongs_to :talk
  belongs_to :student
  belongs_to :farmer
end
