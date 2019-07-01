class AddSubcategoryToRequest < ActiveRecord::Migration[5.2]
  def change
    add_reference :requests, :subcategory, null: true
  end
end
