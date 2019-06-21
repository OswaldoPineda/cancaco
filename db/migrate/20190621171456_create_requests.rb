class CreateRequests < ActiveRecord::Migration[5.2]
  def change
    create_table :requests do |t|
      t.string :title
      t.text :description
      t.float :quantity
      t.date :deadline
      t.boolean :active
      t.references :measure
      t.references :category
      t.references :company
      t.timestamps
    end
  end
end
