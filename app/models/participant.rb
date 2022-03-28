class Participant < ActiveRecord::Base
  belongs_to :user
  belongs_to :user_story, dependent: :destroy 
end
