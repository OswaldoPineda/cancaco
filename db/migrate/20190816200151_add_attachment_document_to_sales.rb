class AddAttachmentDocumentToSales < ActiveRecord::Migration[5.2]
  def self.up
    change_table :sales do |t|
      t.attachment :document
    end
  end

  def self.down
    remove_attachment :sales, :document
  end
end
