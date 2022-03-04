class Comment < ActiveRecord::Base
  belongs_to :task, dependent: :destroy 
  belongs_to :user, dependent: :destroy 

  validates :content, presence:true
end
