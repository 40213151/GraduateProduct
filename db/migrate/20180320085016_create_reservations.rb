class CreateReservations < ActiveRecord::Migration[5.1]
  def change
    create_table :reservations do |t|
      t.references :student, foreign_key: true
      t.references :job, foreign_key: true
      t.datetime :date
      t.datetime :end_date
      t.integer :price_perhour
      t.integer :total_price

      t.timestamps
    end
  end
end
