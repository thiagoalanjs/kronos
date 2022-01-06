class UserSprintNotifierMailer < ApplicationMailer  
    def send_email    
        conn = ActiveRecord::Base.connection 
        res = conn.execute("SELECT users.email FROM function_user_projects INNER JOIN users ON users.id = function_user_projects.user_id WHERE project_id = project_id").to_s
        special_chars = res.tr('[{""=>}] ,"', ' ')
        email = special_chars.gsub(" email ", ";")
    end

    def send_create_sprint_email(sprint)
        @sprint = sprint
        mail( :to => send_email + ';',
        :subject => "A Sprint #{ sprint.name } foi criada com sucesso para o projeto #{ sprint.project.name }" )     
    end

    def send_update_sprint_email(sprint)
        @sprint = sprint
        mail( :to => send_email + ';',
        :subject => "A Sprint #{ sprint.name } foi atualizada com sucesso no projeto #{ sprint.project.name }" )     
    end

    def send_complete_sprint_email(sprint)
        @sprint = sprint
        mail( :to => send_email + ';',
        :subject => "A Sprint #{ sprint.name } foi concluída com sucesso no projeto #{ sprint.project.name }" )     
    end

    def send_delete_sprint_email(sprint)
        @sprint = sprint
        mail( :to => send_email + ';',
        :subject => "A Sprint #{ sprint.name } foi deletada com sucesso no projeto #{ sprint.project.name }" )     
    end
end
