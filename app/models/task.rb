class Task < ActiveRecord::Base
	# enum status: [:development, :pendent, :completed]
	belongs_to :user_story
	#has_and_belongs_to_many :users
  	has_many :users_tasks, dependent: :destroy
  	has_many :users, through: :users_tasks
  	#has_one :kind
  	has_many :task_requirements, dependent: :destroy

	validates :description, presence: true
	# validates :end_date, presence: true
	# validates :start_date, presence: true
	validates :status, presence: true
	validates :user_story_id, presence: true
	#validates :kind_id, presence: true
	validates :priority_id, presence: true

  def status_label
    labels = {1 => 'Pendente', 2 => 'Desenvolvimento', 3 => 'Code Review', 4 => 'QA', 5 => 'Concluída'}
    return labels[self.status]
  end
end
