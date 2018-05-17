class AddFimageToFarmers < ActiveRecord::Migration[5.1]
  def change
    add_column :farmers, :fimage, :string
  end
end
