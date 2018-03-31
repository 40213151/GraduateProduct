class CreateStudentImages < ActiveRecord::Migration[5.1]
  def change
    create_table :student_images do |t|
      t.integer :student_id
      t.string :image_id

      t.timestamps
    end
  end
end
