class CreateTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks do |t|
      t.string :title
      t.text :description
      t.date :end_date
      t.date :start_date
      t.integer :status
      t.references :user_story, index: true, foreign_key: true
      t.references :kind, index: true, foreign_key: true
      t.references :priority, index: true, foreign_key: true
      t.references :function_user_projects, index: true, foreign_key:true
      t.timestamps null: false
    end
  end
end
