class CreateTasks < ActiveRecord::Migration[5.1]
  def change
    create_table :tasks do |t|
      t.text :name
      t.text :status
      t.integer :project_id

      t.timestamps
    end
  end
end
