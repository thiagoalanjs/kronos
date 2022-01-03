class UserStoryNotifierMailer < ApplicationMailer
    def send_email    
        conn = ActiveRecord::Base.connection 
        res = conn.execute("SELECT users.email FROM function_user_projects INNER JOIN users ON users.id = function_user_projects.user_id WHERE project_id = project_id").to_s
        special_chars = res.tr('[{""=>}] ,"', ' ')
        email = special_chars.gsub(" email ", ";")
    end

    def send_create_user_story_email(user_story)
        @user_story = user_story
        mail( :to => send_email + ';',
        :subject => "A User Story US-#{user_story.project.initial}-#{user_story.id} #{user_story.title} foi criada com sucesso no projeto #{ user_story.project.name }!" ) 
    end

    def send_update_user_story_email(user_story)
        @user_story = user_story
        mail( :to => send_email + ';',
        :subject => "Atualização da user story US-#{user_story.project.initial}-#{user_story.id} #{user_story.title} feita com sucesso." ) 
    end

    def send_delete_user_story_email(user_story)
        @user_story = user_story
        mail( :to => send_email + ';',
        :subject => "A User Story US-#{user_story.project.initial}-#{user_story.id} #{user_story.title} foi deletada com sucesso no projeto #{ user_story.project.name }!" ) 
    end
end