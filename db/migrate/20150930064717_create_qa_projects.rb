class CreateQaProjects < ActiveRecord::Migration
  def change
    create_table :qa_projects do |t|
      t.integer :user_id
      t.integer :projects_id

      t.timestamps null: false
    end
  end
end
