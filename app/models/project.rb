class Project < ActiveRecord::Base
  has_many :themes
  has_many :sprints
  has_many :releases
  has_many :function_user_projects
  has_many :functions, through: :function_user_projects
  has_many :users, through: :function_user_projects
  has_many :user_stories
  has_many :tasks, through: :user_stories
  has_rich_text :description

  validates :name, format:{with: /\A[a-zA-Z0-9_ ]+\z/, message: "deve conter apenas letras e números" }, presence: true, uniqueness: { case_sensitive: false }
  validates :initial, length: { in: 2..6, message: "deve ter entre 2 e 6 letras", maximum: 6 },
             format:{ with: /\A[a-zA-Z]+\z/, message: "deve conter apenas letras" }, presence: true, uniqueness: { case_sensitive: false }

  validates :description, presence: true

  validate :start_date_cannot_be_nil, 
           :end_date_cannot_be_nil,
           :end_date_cannot_be_in_the_past

  before_save do |project|
    project.start_date = project.start_date.beginning_of_day
    project.end_date = project.end_date.end_of_day
  end


  def start_date_cannot_be_nil
    if start_date.nil?
      errors.add(:start_date, presence: true, message: "deve ser preenchida")
    end
  end

  def end_date_cannot_be_nil
    if end_date.nil?
      errors.add(:end_date, presence: true, message: "deve ser preenchida")
    end
  end

  def end_date_cannot_be_in_the_past
    if start_date.present? && end_date.present?
      if start_date > end_date
         errors.add(:end_date, message: "não pode ser anterior a data início do projeto")
      end  
    end
  end

  def members_number
    self.users.count
  end

  def current_sprint
    current = nil
    today = Time.now

    self.sprints.each do |sprint|
      if today.between?(sprint.start_date, sprint.end_date)
        current = sprint
      end
    end

    if current.nil?
      return nil
    else
      return current.name
    end
  end

  def size
    self.user_stories.sum(:story_points)
  end

  def progress
    # progress per user story
    # count = self.user_stories.count
    # done = self.user_stories.where(status: 4).count

    # progress per tasks
    count = self.tasks.count
    done = self.tasks.where(status: 5).count

    if count > 0
      return done * 100 / count
    else
      return 0
    end
  end
end
