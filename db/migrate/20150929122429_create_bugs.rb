class CreateBugs < ActiveRecord::Migration
  def change
    create_table :bugs do |t|
      t.string :title
      t.string :description
      t.integer :_type, default: 0
      t.integer :status, default: 0
      t.date :deadline
      t.string :image

      t.integer :project_id, null: false
      t.integer :creator_id
      t.integer :developer_id
      t.timestamps null: false
    end
  end
end
