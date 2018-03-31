class AddExtraFieldsToFarmer < ActiveRecord::Migration[5.1]
  def change
    add_column :farmers, :phone_number, :string
    add_column :farmers, :job_about, :string
    add_column :farmers, :place, :string
    add_column :farmers, :leader_name, :string
    add_column :farmers, :member_number, :integer
    add_column :farmers, :description_us, :text
    add_column :farmers, :description_about, :text
  end
end
