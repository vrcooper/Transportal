class CreateCollaborations < ActiveRecord::Migration
  def change
    create_table :collaborations do |t|
      t.references :project, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
