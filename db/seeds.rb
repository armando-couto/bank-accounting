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

accounts = Account.all

5000.times do |i|
  puts "Transação #{i}"

  source = accounts.sample
  destination = accounts.sample

  if source != destination
    Moviment.table_name = "moviment_#{source.number}"
    Moviment.create({
                        description: "Gerada Pela SEED",
                        source: source.number,
                        destination: destination.number,
                        amount: i % 2 == 0 ? Faker::Number.decimal : Faker::Number.negative,
                        observation: ''
                    })
  end
end