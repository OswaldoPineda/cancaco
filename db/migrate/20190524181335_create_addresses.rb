class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.integer :zipCode
      t.string :city
      t.string :state
      t.string :street
      t.string :interiorNumber
      t.integer :outdoorNumber
      t.references :company
      t.timestamps
    end
  end
end
