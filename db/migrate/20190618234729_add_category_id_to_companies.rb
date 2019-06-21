class AddCategoryIdToCompanies < ActiveRecord::Migration[5.2]
  def change
    add_reference :companies, :category, index: true
  end
end
