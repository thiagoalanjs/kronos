class UserUpdateSprintNotifierMailer < ApplicationMailer
    def send_update_sprint_email(sprint)
        conn = ActiveRecord::Base.connection 
        res = conn.execute("SELECT users.email FROM function_user_projects INNER JOIN users ON users.id = function_user_projects.user_id WHERE project_id = project_id").to_s
        special_chars = res.tr('[{""=>}] ,"', ' ')
        email = special_chars.gsub(" email ", ";")
        @sprint = sprint
        mail( :to => email + ';',
        :subject => "A Sprint #{ sprint.name } foi atualizada com sucesso no projeto #{ sprint.project.name }" )     
    end
end
