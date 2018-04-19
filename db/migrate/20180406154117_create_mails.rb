class CreateMails < ActiveRecord::Migration[5.1]
  def change
    create_table :mails do |t|
      t.text :body
      t.references :talk, foreign_key: true
      t.references :student, foreign_key: true
      t.references :farmer, foreign_key: true

      t.timestamps
    end
  end
end
