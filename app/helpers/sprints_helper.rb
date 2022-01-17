module SprintsHelper
    def late_sprint
      @sprint = Sprint.connection.select_value("
                SELECT name from sprints 
                       WHERE end_date < '#{ Time.now }' 
                AND sprint_status = 'ATIVA' 
                AND project_id = #{ current_project_id }")
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


    def sprint_days_finished_count
      @sprint = Sprint.connection.select_value("SELECT JULIANDAY(DATE(updated_at,'localtime')) - JULIANDAY(DATE(end_date,'localtime')) AS 'Dias em aberto' 
                                     FROM sprints WHERE id = id")

     if @sprint == 1 
       "#{@sprint.to_i} " + 'dia'
     elsif @sprint > 1 
       "#{@sprint.to_i} " + 'dias'
     end                               
   end
end
