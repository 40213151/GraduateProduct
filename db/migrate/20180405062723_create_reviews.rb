class CreateReviews < ActiveRecord::Migration[5.1]
  def change
    create_table :reviews do |t|
      t.text :description
      t.integer :rate
      t.references :farmer, foreign_key: true
      t.references :student, foreign_key: true

      t.timestamps
    end
  end
end
