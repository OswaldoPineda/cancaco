class ChangeIntegersToStringsInAddress < ActiveRecord::Migration[5.2]
  def change
    change_column :addresses, :zip_code, :string
    change_column :addresses, :outdoor_number, :string
  end
end
