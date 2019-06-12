class CreateSubcategories < ActiveRecord::Migration[5.2]
  def change
    create_table :subcategories do |t|
      t.text :title
      t.references :category
      t.timestamps
    end
  end
end
