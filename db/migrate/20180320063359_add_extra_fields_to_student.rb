class AddExtraFieldsToStudent < ActiveRecord::Migration[5.1]
  def change
    add_column :students, :name, :string
    add_column :students, :place, :string
    add_column :students, :school, :string
    add_column :students, :description_pr, :text
    add_column :students, :age, :integer
    add_column :students, :description_interested, :text
    add_column :students, :facebook, :string
    add_column :students, :twitter, :string
  end
end
