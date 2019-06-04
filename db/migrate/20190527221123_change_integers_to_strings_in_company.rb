class ChangeIntegersToStringsInCompany < ActiveRecord::Migration[5.2]
  def change
    change_column :companies, :affiliation, :string
    change_column :companies, :phone, :string
    change_column :companies, :cellphone, :string
  end
end
