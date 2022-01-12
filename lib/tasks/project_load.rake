namespace :project_load do
    desc "Criando teste de carga com 500 projetos"
    task setup: :environment do
        puts "Project Load test..."
           780.times do |i|

                Project.create(name: "#{Faker::Number.unique.number(digits: 10)}", 
                               initial: "#{ SecureRandom.urlsafe_base64(4) }", 
                               description: "Teste de carga", 
                               start_date: '2022-05-03',
                               end_date: '2023-12-12' )
                end
        puts "Done!"
    end
end
