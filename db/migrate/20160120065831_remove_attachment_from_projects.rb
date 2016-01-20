class RemoveAttachmentFromProjects < ActiveRecord::Migration
  def change
    remove_column :projects, :attachment
  end
end
