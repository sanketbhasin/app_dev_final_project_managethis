class CreateBugs < ActiveRecord::Migration[5.1]
  def change
    create_table :bugs do |t|
      t.integer :project_id
      t.string :title
      t.string :description
      t.string :deadline
      t.string :image_of_bug
      t.string :status

      t.timestamps
    end
  end
end
