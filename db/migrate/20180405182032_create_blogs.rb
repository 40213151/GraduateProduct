class CreateBlogs < ActiveRecord::Migration[5.1]
  def change
    create_table :blogs do |t|
      t.string :blog_title
      t.string :blog_content
      t.references :farmer, foreign_key: true

      t.timestamps
    end
  end
end
