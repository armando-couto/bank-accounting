puts "Criando Usuários"

50.times do
  User.create({
                  name: Faker::Name.name,
                  email: Faker::Internet.email,
                  password: "123456"
              })
end