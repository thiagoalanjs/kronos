namespace :user_load do
    desc "Criando teste de carga com 500 usuários"
    task setup: :environment do
        puts "Users Load test..."
            1000.times do |i|
                User.create(name: "#{ Faker::Name.unique.name }", email: "#{ Faker::Internet.unique.email }", password: "12345678", password_confirmation: "12345678", group: :analista)
            end
        puts "Done!"
    end
end
