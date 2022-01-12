namespace :user_story_load do
    desc "Teste de carga para 500 users stories"
    task setup: :environment do
        puts "Users Load test..."
            1000.times do |i|
                UserStory.create(business_value: "10",
                                 story_points: "10", 
                                 title: "#{ Faker::Number.unique.number(digits: 10) }",
                                 description: "teste" ,
                                 priority_id: "1",
                                 status: "1",
                                 project_id: "1437"
                                 )
            end
        puts "Done!"
    end
end
