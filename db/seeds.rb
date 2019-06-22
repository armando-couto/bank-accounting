puts "Criando Usuários"

50.times do
  User.create({
                  name: Faker::Name.name,
                  username: Faker::Internet.user_name,
                  email: Faker::Internet.email,
                  password: "123456"
              })
end