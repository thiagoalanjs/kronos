class Theme < ActiveRecord::Base
  belongs_to :project
  has_many :user_stories, dependent: :destroy 

  validates :name, presence: true, format:{ with: /\A[a-zA-Z ]+\z/, message: "deve conter apenas letras" }
  validates :project_id, presence: true

end
