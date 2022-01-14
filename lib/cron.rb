class Cron < ActiveRecord::Base
    def TestCron
        p "Teste de cron em 1 minuto"
    end
end