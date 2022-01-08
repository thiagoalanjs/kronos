module SprintsHelper
    def user_story_count
      UserStory.where(@sprint).count
    end

    def task_bug_count
      Task.joins("INNER JOIN user_stories 
                ON user_stories.id = tasks.user_story_id
                WHERE kind_id = 1 AND  sprint_id = sprint_id").count
    end
    
    def task_sub_task_count
      Task.joins("INNER JOIN user_stories 
             ON user_stories.id = tasks.user_story_id 
             WHERE kind_id = 2 AND sprint_id = sprint_id").count
    end
end
