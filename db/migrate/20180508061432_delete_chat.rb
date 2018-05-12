class DeleteChat < ActiveRecord::Migration[5.1]
  def change
    drop_table :chats
    drop_table :talks
    drop_table :conversations
    drop_table :messages
  end
end
