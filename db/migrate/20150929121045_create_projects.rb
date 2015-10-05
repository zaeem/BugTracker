class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :title
      t.integer :deadline_in_months

      t.integer :manager_id
      t.timestamps null: false
    end
  end
end
