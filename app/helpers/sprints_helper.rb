module SprintsHelper
    def late_sprint
      @sprint = Sprint.connection.select_value("
                SELECT name from sprints 
                       WHERE end_date < '#{ Time.now }' 
                AND sprint_status = 'ATIVA' 
                AND project_id = #{ current_project_id }")
    end

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

    def sprint_status_actived_count?
      Sprint.find_by_sql("SELECT * from sprints 
                          where sprint_status == 'ATIVA' 
                          AND project_id = #{ current_project_id } ").count == 0
    end

    def sprint_days_count
       @sprint = Sprint.connection.select_value("SELECT JULIANDAY(DATE('now','localtime')) - JULIANDAY(DATE(end_date,'localtime')) AS 'Dias em aberto' 
                                      FROM sprints WHERE id = id")

      if @sprint == 1 
        "#{@sprint.to_i} " + 'dia'
      elsif @sprint > 1 
        "#{@sprint.to_i} " + 'dias'
      end                               
    end
end
