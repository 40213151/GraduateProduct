class AddBimageToBlogs < ActiveRecord::Migration[5.1]
  def change
    add_column :blogs, :bimage, :string
  end
end
