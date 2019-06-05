class FixColumnsOfAddress < ActiveRecord::Migration[5.2]
  def change
    rename_column :addresses, :zipCode, :zip_code
    rename_column :addresses, :interiorNumber, :interior_number
    rename_column :addresses, :outdoorNumber, :outdoor_number
  end
end
