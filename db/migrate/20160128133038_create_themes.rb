class CreateThemes < ActiveRecord::Migration[5.2]
  def change
    create_table :themes do |t|
      t.string :name
      t.text :description
      t.references :project, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
