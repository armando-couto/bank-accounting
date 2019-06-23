puts "Populando o banco de dados"

50.times do
  client = Client.new({
                          name: Faker::Name.name,
                          cpf: Faker::CPF.numeric,
                          email: Faker::Internet.email,
                          password: "123456"
                      })
  client.save

  Account.create({
                     client: client,
                     number: Faker::Bank.account_number,
                     balance: Faker::Number.decimal,
                 })
end

100000.times do



end