module ChartsHelper
 def user_story_by_project_count
    UserStory.where(project: current_project).count
 end

 def user_story_pending_count
    UserStory.where(status: 1, project: current_project).count
 end

 def user_story_development_count
    UserStory.where(status: 2, project: current_project).count
 end

 def user_story_code_review_count
   UserStory.where(status: 3, project: current_project).count
 end

 def user_story_qa_count
   UserStory.where(status: 4, project: current_project).count
 end

 def user_story_finished_count
   UserStory.where(status: 5, project: current_project).count
 end
 
 def sprint_by_project_count
    Sprint.where(project: current_project).count
 end

 def users_by_project_count
   FunctionUserProject.where(project: current_project_id).count
 end

 def task_flag_count
  @tasks_flag_count = ActiveRecord::Base.connection
  @tasks_flag_count.execute("SELECT COUNT(*)
                             FROM tasks
                              INNER JOIN user_stories ON tasks.user_story_id = user_stories.id 
                          WHERE impediment = 1 
                          AND project_id = #{ current_project_id }").count
 end

 def task_without_flag_count
  Task.joins("INNER JOIN user_stories ON tasks.user_story_id = user_stories.id 
              WHERE impediment = 0 AND project_id = #{ current_project_id }").count
 end

 def sub_task_by_project_count
    Task.joins("INNER JOIN user_stories ON user_stories.id = 
      tasks.user_story_id
      WHERE kind_id = 2 
      AND project_id = '#{ current_project_id }'").count 
 end

 def sub_task_pending_project_count
    Task.joins("INNER JOIN user_stories ON user_stories.id =
       tasks.user_story_id 
       WHERE kind_id = 2 
       AND tasks.status = 1 
       AND project_id = '#{ current_project_id }'").count
 end

 def sub_task_development_project_count
    Task.joins("INNER JOIN user_stories ON user_stories.id = 
      tasks.user_story_id 
      WHERE kind_id = 2 
      AND tasks.status = 2 
      AND project_id = '#{ current_project_id }'").count
 end
 
 def sub_task_code_review_project_count
    Task.joins("INNER JOIN user_stories ON user_stories.id = 
      tasks.user_story_id 
      WHERE kind_id = 2 
      AND tasks.status = 3 
      AND project_id = '#{ current_project_id }'").count
 end

 def sub_task_qa_project_count
   Task.joins("INNER JOIN user_stories ON user_stories.id = 
     tasks.user_story_id 
     WHERE kind_id = 2 
     AND tasks.status = 5 
     AND project_id = '#{ current_project_id }'").count
 end
 
 def sub_task_finished_project_count
     Task.joins("INNER JOIN user_stories ON user_stories.id =
       tasks.user_story_id 
       WHERE kind_id = 2 
       AND tasks.status = 5 
       AND project_id = '#{ current_project_id }'").count   
 end

 def bug_by_project_count
    Task.joins("INNER JOIN user_stories ON user_stories.id = 
      tasks.user_story_id
      WHERE kind_id = 1 
      AND project_id = '#{ current_project_id }'").count
 end     

 def bug_pending_project_count
   Task.joins("INNER JOIN user_stories ON user_stories.id = 
      tasks.user_story_id 
      WHERE kind_id = 1 
      AND tasks.status = 1 
      AND project_id = '#{ current_project_id }'").count
 end

 def bug_development_project_count 
   Task.joins("INNER JOIN user_stories ON user_stories.id = 
      tasks.user_story_id 
      WHERE kind_id = 1 
      AND tasks.status = 2 
      AND project_id = '#{ current_project_id }'").count
 end

 def bug_code_review_project_count
   Task.joins("INNER JOIN user_stories ON user_stories.id = 
      tasks.user_story_id 
      WHERE kind_id = 1 
      AND tasks.status = 3 
      AND project_id = '#{ current_project_id }'").count
 end 

 def bug_qa_project_count
   Task.joins("INNER JOIN user_stories ON user_stories.id = 
      tasks.user_story_id 
      WHERE kind_id = 1 
      AND tasks.status = 4 
      AND project_id = '#{ current_project_id }'").count 
 end
 
 def bug_finished_project_count
   Task.joins("INNER JOIN user_stories ON user_stories.id = 
      tasks.user_story_id 
      WHERE kind_id = 1 
      AND tasks.status = 5 
      AND project_id = '#{ current_project_id }'").count
 end


 def task_by_users
   @tasks_by_users = ActiveRecord::Base.connection
   @tasks_by_users.execute("SELECT users.name,
	                              COUNT(*)
                            FROM tasks
	                              INNER JOIN users ON tasks.function_user_project_id = function_user_projects.id
	                              INNER JOIN function_user_projects ON function_user_projects.user_id = users.id
                          	WHERE project_id = #{ current_project_id }
                            GROUP BY tasks.function_user_project_id")         
 end

end