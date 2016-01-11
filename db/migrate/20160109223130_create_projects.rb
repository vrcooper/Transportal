class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :title
      t.text :body
      t.string :attachment
      t.string :name
      t.timestamps null: false
    end
  end
end
