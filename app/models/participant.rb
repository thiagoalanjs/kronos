class Participant < ActiveRecord::Base
  belongs_to :user, dependent: :destroy 
  belongs_to :user_story, dependent: :destroy 
end
