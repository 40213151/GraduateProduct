class CreateJobImages < ActiveRecord::Migration[5.1]
  def change
    create_table :job_images do |t|
      t.integer :job_id
      t.string :image_id

      t.timestamps
    end
  end
end
