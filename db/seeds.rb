puts "Populando o banco de dados"

puts "Criando um cliente default"
client = Client.new({
                        name: "Armando Couto",
                        cpf: Faker::CPF.numeric,
                        email: "armando@empresa.com.br",
                        password: "123456"
                    })
client.save

Account.create({
                   client: client,
                   number: Faker::Bank.account_number,
                   balance: Faker::Number.decimal(4, 4),
               })
########################################################################

puts "Criando 50 clientes random"
50.times do
  client = Client.new({
                          name: Faker::Name.name,
                          cpf: Faker::CPF.numeric,
                          email: Faker::Internet.email,
                          password: "123456"
                      })
  client.save

  balance = Faker::Number.decimal(4, 4)
  account = Account.create({
                               client: client,
                               number: Faker::Bank.account_number,
                               balance: balance,
                           })

  # Creditando o dinheiro no DESTINO
  Moviment.table_name = "moviment_#{account.number}"
  Moviment.create({
                      description: "Gerada Para Um Saldo Positivo",
                      route: "CREDIT00000000000",
                      amount: balance,
                      observation: ''
                  })

end
########################################################################

accounts = Account.all

5000.times do |i|
  puts "Criando a transação #{i}."

  origin = accounts.sample
  destination = accounts.sample

  if origin != destination # Esse IF é só para nao seixar um ORIGEM ser igual DESTINO
    amount = Faker::Number.decimal(4, 4)
    amount_destination = amount.to_f * -1

    if origin.check_limit amount_destination

      # Retirando o dinheiro da ORIGEM
      Moviment.table_name = "moviment_#{origin.number}"
      Moviment.create({
                          description: "Gerada Pela SEED",
                          route: "DEBIT#{destination.number}",
                          amount: amount_destination,
                          observation: ''
                      })

      # Creditando o dinheiro no DESTINO
      Moviment.table_name = "moviment_#{destination.number}"
      Moviment.create({
                          description: "Gerada Pela SEED",
                          route: "CREDIT#{origin.number}",
                          amount: amount,
                          observation: ''
                      })

      origin.update({balance: Moviment.sum(:amount)})
      destination.update({balance: Moviment.sum(:amount)})
    end
  end
end