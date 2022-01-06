class Task < ActiveRecord::Base
	belongs_to :user_story
  	has_many :users_tasks, dependent: :destroy
  	has_many :users, through: :users_tasks

	validates :title, format:{with: /\A[a-zA-Z0-9_ ]+\z/, message: "deve conter apenas letras e números" }, presence: true, uniqueness: { case_sensitive: false }
	validates :description, presence: true
	validates :status, presence: true
	validates :user_story_id, presence: true
	validates :kind_id, presence: true
	validates :priority_id, presence: true


  def status_label
    labels = {1 => 'Pendente', 2 => 'Desenvolvimento', 3 => 'Code Review', 4 => 'QA', 5 => 'Concluída'}
    return labels[self.status]
  end
end
