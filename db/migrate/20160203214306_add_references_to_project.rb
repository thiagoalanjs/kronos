class AddReferencesToProject < ActiveRecord::Migration[5.2]
  def change
    add_reference :user_stories, :project, index: true, foreign_key: true
  end
end
