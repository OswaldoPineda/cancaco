class CreateImages < ActiveRecord::Migration[5.2]
  create_table :images do |t|
    t.attachment :file
    t.references :sale
    t.timestamps
  end
end
