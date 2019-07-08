class RenameRequestToPetitions < ActiveRecord::Migration[5.2]
  def change
    rename_table :requests, :petitions
  end
end
