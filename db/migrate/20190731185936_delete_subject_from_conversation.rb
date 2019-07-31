class DeleteSubjectFromConversation < ActiveRecord::Migration[5.2]
  def change
    remove_column :conversations, :subject_type
    remove_column :conversations, :subject_id
  end
end
