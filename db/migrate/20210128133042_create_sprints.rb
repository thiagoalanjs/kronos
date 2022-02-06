class CreateSprints < ActiveRecord::Migration[5.2]
  def change
    create_table :sprints do |t|
      t.string :name
      t.datetime :start_date
      t.datetime :end_date
      t.datetime :planning_start_date
      t.datetime :planning_end_date
      t.datetime :execution_start_date
      t.datetime :execution_end_date
      t.datetime :review_meeting_date
      t.datetime :retrospective_meeting_date
      t.string :sprint_status, default: 'ATIVA'
      t.references :project, index: true, foreign_key: true
      t.references :release, index: true, foreign_key: true
      t.timestamps null: false
    end
  end
end
