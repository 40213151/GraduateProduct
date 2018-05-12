class Message < ApplicationRecord
  belongs_to :conversation
  belongs_to :farmer
  belongs_to :student

  validates_presence_of :body, :conversation_id, :student_id || :farmer_id

  def message_time
    created_at.strftime("%Y年%m月%d日")
  end
end
