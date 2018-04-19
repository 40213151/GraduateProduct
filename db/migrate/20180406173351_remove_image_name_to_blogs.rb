class RemoveImageNameToBlogs < ActiveRecord::Migration[5.1]
  def change
    remove_column :blogs, :image_name, :string
  end
end
