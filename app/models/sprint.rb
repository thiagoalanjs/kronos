class Sprint < ActiveRecord::Base
  belongs_to :project
  belongs_to :release
  
  has_many :user_stories, dependent: :destroy 
  has_many :tasks, through: :user_stories, dependent: :destroy 

  validates :name, presence: true, format:{ with: /\A[a-zA-ZzáàâãéèêíïóôõöúçñÁÀÂÃÉÈÍÏÓÔÕÖÚÇÑ0-9_ ]+\z/, message: "deve conter apenas letras e números" }, uniqueness: { case_sensitive: false }
  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :planning_start_date, presence: true
  validates :planning_end_date, presence: true
  validates :execution_start_date, presence: true
  validates :execution_end_date, presence: true
  validates :review_meeting_date, presence: true
  validates :project_id, presence: true

  before_save do |project|
    project.start_date = project.start_date.beginning_of_day
    project.end_date = project.end_date.end_of_day
  end

  def progress
    count = self.tasks.count
    done = self.tasks.where(status: 5).count

    if count > 0
      return done * 100 / count
    else
      return 0
    end
  end

  def self.send_email_late_sprint
    sprint_status_actived = self.find_by_sql("SELECT end_date from sprints 
                                                     WHERE sprint_status = 'ATIVA' 
                                                     AND project_id = project_id")
    p sprint_status_actived
    if sprint_status_actived << Time.now  
      UserSprintNotifierMailer.send_late_sprint_email(@sprint).deliver 
    end
  end
  
  

end


