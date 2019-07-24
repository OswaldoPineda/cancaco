class CreateConversations < ActiveRecord::Migration[5.2]
  def change
    create_table :conversations do |t|
      t.references :sender
      t.references :recipient
      t.string :subject_type
      t.integer :subject_id
      t.timestamps
    end
  end
end
