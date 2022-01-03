class UserDoneTaskNotifierMailer < ApplicationMailer
    def send_done_task_email(function_user_project)
        @function_user_project = function_user_project
        mail( :to => @function_user_project.user.email,
        :subject => "Exclusão do projeto #{ @function_user_project.project.name }" )     
    end
end
