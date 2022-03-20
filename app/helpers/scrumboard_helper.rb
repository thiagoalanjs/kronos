module ScrumboardHelper

    def sprint_actived
        Sprint.find_by_sql("SELECT * from sprints 
                                where sprint_status == 'ATIVA'
                                AND project_id = #{ current_project_id } order by id desc limit 1 ")
    end

    def last_sprint
        sprint = ActiveRecord::Base.connection
        res_query = sprint.execute("SELECT sprint_status from sprints
                                   WHERE project_id = #{ current_project_id } 
                                   order by id desc limit 1")  
        delete_chars = res_query.to_s                            
        delete_chars.delete('[{"sprint_status"=>""}]')                           
    end
  
    def tasks_pending_count
        Task.find_by_sql("SELECT * FROM tasks
                  INNER JOIN user_stories ON user_stories.sprint_id = sprint 
                  WHERE tasks.status = 1 
            ").count
    end

    def tasks_development_count
        Task.find_by_sql("SELECT * FROM tasks where status = 2").count
    end

    def tasks_code_review_count
        Task.find_by_sql("SELECT * FROM tasks where status = 3").count
    end

    def tasks_qa_count
        Task.find_by_sql("SELECT * FROM tasks where status = 4").count
    end

    def tasks_finished_count
        Task.find_by_sql("SELECT * FROM tasks where status = 5").count
    end
end
