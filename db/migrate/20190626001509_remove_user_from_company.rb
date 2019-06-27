class RemoveUserFromCompany < ActiveRecord::Migration[5.2]
  def change
    change_table :companies do |t|
      t.remove_references :user
    end
  end
end
