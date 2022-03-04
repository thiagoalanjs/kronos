class Task < ActiveRecord::Base
	belongs_to :user_story
	belongs_to :user
	belongs_to :function_user_project 
  	has_many :users_tasks, dependent: :destroy 
  	has_many :users, through: :users_tasks, dependent: :destroy 
	has_many :comments, dependent: :destroy
	validates :title, format:{ with: /\A[a-zA-ZzáàâãéèêíïóôõöúçñÁÀÂÃÉÈÍÏÓÔÕÖÚÇÑ0-9_ ]+\z/, message: "deve conter apenas letras e números" }, presence: true, uniqueness: { case_sensitive: false }
	validates :description, presence: true
	validates :status, presence: true
	validates :user_story_id, presence: true
	validates :kind_id, presence: true
	validates :priority_id, presence: true

  def status_label
    labels = {1 => 'Pendente', 2 => 'Desenvolvimento', 3 => 'Code Review', 4 => 'QA', 5 => 'Concluída'}
    return labels[self.status]
  end


  def self.user_email(task)
	self.connection.select_value("SELECT users.email 
		FROM tasks 
		INNER JOIN users ON tasks.id = users.id"
	)
  end
end
