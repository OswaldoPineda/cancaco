class CreateNotifications < ActiveRecord::Migration[5.2]
  def change
    create_table :notifications do |t|
      t.boolean :checked, default: false
      t.references :company, foreign_key: true
      t.integer :recipient_id
      t.string :action
      t.string :notifiable_type
      t.integer :notifiable_id

      t.timestamps
    end
  end
end
