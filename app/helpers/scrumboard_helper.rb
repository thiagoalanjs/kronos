module ScrumboardHelper
    def sprint_actived
        Sprint.find_by_sql("SELECT * from sprints 
                                where sprint_status == 'ATIVA'
                                AND project_id = #{ current_project_id } ")
    end


    def tasks_pending_count
        Task.find_by_sql("SELECT * FROM tasks where status = 1").count
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
