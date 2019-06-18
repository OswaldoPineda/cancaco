class RemoveUnnecessaryColumnsFromMultipleTables < ActiveRecord::Migration[5.2]
  def change
    remove_column :companies, :phone, :string
    remove_column :companies, :cellphone, :string
    remove_column :addresses, :interior_number, :string
    remove_column :addresses, :outdoor_number, :string
  end
end
