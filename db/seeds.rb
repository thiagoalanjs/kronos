puts "creating administrator..."
User.create(name: "Admin", email: "admin@email.com", password: "admin", password_confirmation: "admin", group: :admin)
User.create(name: "Admin", email: "puc@mailinator.com", password: "12345678", password_confirmation: "admin", group: :admin)
puts "user: admin@email.com"
puts "pswd: admin"

puts "creating functions..."
Function.create(name: 'Product Owner', description: 'O Product Owner pode acompanhar o desenvolvimento do projeto, visualizando cada etapa do desenvolvimento.')
Function.create(name: 'Scrum Master', description: 'O Scrum master irá auxiliar a equipe, removendo qualquer impedimento que implique no sucesso do projeto.')
Function.create(name: 'Backend Developer', description: 'O programador é o membro responsável por codificar APIs e interações do lado do servidor.')
Function.create(name: 'Frontend Developer', description: 'O programador é o membro responsável por codificar a interface da aplicação.')
Function.create(name: 'UX Design', description: 'O UX design é quem irá trabalhar em todos os componentes visuais de um sistema.')
Function.create(name: 'QA', description: 'O QA é quem irá testar cada tarefa desenvolvida e se está dentro dos critérios de aceitação.')

puts "creating Kinds..."
Kind.create(name: 'Bug')
Kind.create(name: 'Sub-task')

puts "creating Priorities..."
Priority.create(name: 'Alta')
Priority.create(name: 'Média')
Priority.create(name: 'Baixa')

puts "done!"