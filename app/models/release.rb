class Release < ActiveRecord::Base
  belongs_to :project
  has_many :sprints, dependent: :destroy 

  validates :version, presence: true
  validates :deliver_date, presence: true
  validates :project_id, presence: true
end
