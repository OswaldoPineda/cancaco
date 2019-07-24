class AddDefaultValueToPetition < ActiveRecord::Migration[5.2]
  def change
    change_column :petitions, :active, :boolean, default: true
  end
end
