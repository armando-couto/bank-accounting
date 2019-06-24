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
                     balance: 0.0000,
                     limit: Faker::Number.decimal(5, 4),
                 })
end

accounts = Account.all

5000.times do |i|
  puts "Criando a transação #{i}."

  origin = accounts.sample
  destination = accounts.sample

  if origin != destination
    amount = Faker::Number.decimal(3, 4)

    # Nesse caso ele tem uma Destino o dinheiro
    Moviment.table_name = "moviment_#{origin.number}"
    Moviment.create({
                        description: "Gerada Pela SEED",
                        route: "DEBIT#{destination.number}",
                        amount: amount.to_f * -1,
                        observation: ''
                    })

    # Nesse caso ele tem uma Origem o dinheiro
    Moviment.table_name = "moviment_#{destination.number}"
    Moviment.create({
                        description: "Gerada Pela SEED",
                        route: "CREDIT#{origin.number}",
                        amount: amount,
                        observation: ''
                    })
  end
end