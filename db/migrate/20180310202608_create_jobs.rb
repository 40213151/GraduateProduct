class CreateJobs < ActiveRecord::Migration[5.1]
  def change
    create_table :jobs do |t|
      t.string :name
      t.string :place
      t.text :description
      t.string :character
      t.integer :price_perhour
      t.references :farmer, foreign_key: true

      t.timestamps
    end
  end
end
