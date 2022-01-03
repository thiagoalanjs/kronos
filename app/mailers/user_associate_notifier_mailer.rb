class UserAssociateNotifierMailer < ApplicationMailer
    def send_associated_email(function_user_project)
        @function_user_project = function_user_project
        mail( :to => @function_user_project.user.email,
        :subject => "Inclusão no projeto #{ @function_user_project.project.name }" ) 
    end
    
    def send_delete_associated_email(function_user_project)
        @function_user_project = function_user_project
        mail( :to => @function_user_project.user.email,
        :subject => "Exclusão do projeto #{ @function_user_project.project.name }" )     
    end
end
