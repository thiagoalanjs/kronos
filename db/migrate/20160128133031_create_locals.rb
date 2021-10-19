class CreateLocals < ActiveRecord::Migration[5.2]
  def change
    create_table :locals do |t|
      t.string :name
      t.string :country
      t.string :state
      t.string :city
      t.string :zip_code

      t.timestamps null: false
    end
  end
end
