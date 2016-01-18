class AddDocumentToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :document_id, :integer
    add_index :projects, :document_id
  end
end
