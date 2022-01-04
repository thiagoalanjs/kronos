class CreateUserStories < ActiveRecord::Migration[5.2]
  def change
    create_table :user_stories do |t|
      t.string :title
      t.text :description
      t.integer :business_value
      t.integer :story_points
      t.integer :status
      t.references :theme, index: true, foreign_key: true
      t.references :sprint, index: true, foreign_key: true
      t.references :priority, index: true, foreign_key: true
      t.references :project, foreign_key: true
      t.timestamps null: false
    end
  end
end
