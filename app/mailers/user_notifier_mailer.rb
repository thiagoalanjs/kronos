class UserNotifierMailer < ApplicationMailer
    def send_registered_email(user)
        @user = user
        mail( :to => @user.email,
        :subject => 'Cadastro na plataforma Agile Kronos feito com sucesso!' )
    end

    def send_delete_email(user)
        @user = user
        mail( :to => @user.email,
        :subject => 'Exclusão da plataforma Agile Kronos feito com sucesso!' )
      end
  end
end
