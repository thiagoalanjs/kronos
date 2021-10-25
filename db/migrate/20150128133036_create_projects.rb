class CreateProjects < ActiveRecord::Migration[5.2]
  def change
    create_table :projects do |t|
      t.string :name
      t.string :initial
      t.text :description
      t.integer :size
      t.datetime :start_date
      t.datetime :end_date
      t.timestamps null: false
    end
  end
end
