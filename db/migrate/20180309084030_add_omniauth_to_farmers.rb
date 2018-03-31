class AddOmniauthToFarmers < ActiveRecord::Migration[5.1]
  def change
    add_column :farmers, :provider, :string
    add_column :farmers, :uid, :string
    add_column :farmers, :image, :string
    add_column :farmers, :name, :string
  end
end
