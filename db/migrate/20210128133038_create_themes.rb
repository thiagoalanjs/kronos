class CreateThemes < ActiveRecord::Migration[5.2]
  def change
    create_table :themes do |t|
      t.string :name
      t.text :description
      t.timestamps null: false
      t.references :project, foreign_key: true
    end
  end
end
