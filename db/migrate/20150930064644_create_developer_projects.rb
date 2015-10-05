class CreateDeveloperProjects < ActiveRecord::Migration
  def change
    create_table :developer_projects do |t|
      t.integer :developer_id, 	null: false
      t.integer :project_id, 	null: false

      t.timestamps null: false
    end
  end
end
