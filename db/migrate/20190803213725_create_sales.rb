class CreateSales < ActiveRecord::Migration[5.2]
  def change
    create_table :sales do |t|
      t.string :title
      t.string :description
      t.string :extra_info
      t.float :quantity
      t.float :price
      t.references :company
      t.references :category
      t.references :subcategory
      t.timestamps
    end
  end
end
