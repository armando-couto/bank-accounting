puts "Populando o banco de dados"

50.times do
  Client.create({
                  name: Faker::Name.name,
                  cpf: Faker::CPF.numeric,
                  email: Faker::Internet.email,
                  password: "123456"
              })

  # Account.create({
  #                    number: Faker::Bank.account_number,
  #                    name: Faker::Bank.name,
  #                })
end