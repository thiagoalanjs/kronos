class CreateParticipants < ActiveRecord::Migration[5.2]
  def change
    create_table :participants do |t|
      t.references :user, index: true, foreign_key: true
      t.references :user_story, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
