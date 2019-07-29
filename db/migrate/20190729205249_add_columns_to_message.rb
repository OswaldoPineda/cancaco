class AddColumnsToMessage < ActiveRecord::Migration[5.2]
  def change
    add_column :messages, :read, :boolean, default: false
    add_reference :messages, :recipient
  end
end
