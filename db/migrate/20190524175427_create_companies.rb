class CreateCompanies < ActiveRecord::Migration[5.2]
  def change
    create_table :companies do |t|
      t.integer :affiliation
      t.string :name
      t.integer :phone
      t.integer :cellphone

      t.timestamps
    end
  end
end
