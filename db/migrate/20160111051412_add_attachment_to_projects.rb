class AddAttachmentToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :attachment, :string
    add_column :projects, :name, :string
  end
end
