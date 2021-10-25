class CreateFunctions < ActiveRecord::Migration[5.2]
  def change
    create_table :functions do |t|
      t.string :name
      t.text :description
      t.timestamps null: false
    end
  end
end


