class CreateTaskRequirements < ActiveRecord::Migration[5.2]
  def change
    create_table :task_requirements do |t|
      t.integer :level
      t.references :task, index: true, foreign_key: true
      t.timestamps null: false
    end
  end
end
