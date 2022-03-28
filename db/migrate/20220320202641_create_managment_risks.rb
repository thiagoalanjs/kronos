class CreateManagmentRisks < ActiveRecord::Migration[6.1]
  def change
    create_table :managment_risks do |t|
      t.string :title
      t.text :description
      t.string :probabitity
      t.string :contingency
      t.string :status
      t.references :project, index: true, foreign_key: true

      t.timestamps
    end
  end
end
