puts "Populando o banco de dados"

puts "Criando um cliente default"
client = Client.new({
                        name: "Armando Couto",
                        cpf: Faker::CPF.numeric,
                        email: "armando@empresa.com.br",
                        password: "123456"
                    })
client.save

BALANCE_DEFAULT = 10000.0000

account = Account.create({
                             client: client,
                             number: Faker::Bank.account_number,
                             balance: BALANCE_DEFAULT,
                         })
Moviment.table_name = "moviment_#{account.number}"
Moviment.create({
                    description: "DEPOSITO_DO_BANCO",
                    route: "00000000000",
                    amount: BALANCE_DEFAULT,
                    observation: ''
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

  account = Account.create({
                               client: client,
                               number: Faker::Bank.account_number,
                               balance: BALANCE_DEFAULT,
                           })

  Moviment.table_name = "moviment_#{account.number}"
  Moviment.create({
                      description: "DEPOSITO_DO_BANCO",
                      route: "00000000000",
                      amount: BALANCE_DEFAULT,
                      observation: ''
                  })
end
########################################################################

5000.times do |i|
  puts "Criando a transação #{i}."

  accounts = Account.all # A lista tem que ficar aqui para sempre está atualizada
  origin = accounts.sample
  destination = accounts.sample

  if origin != destination # Esse IF é só para nao seixar um ORIGEM ser igual DESTINO
    amount = Faker::Number.decimal(4, 4)
    amount_destination = amount.to_f * -1

    # Retirando o dinheiro da ORIGEM
    Moviment.table_name = "moviment_#{origin.number}"
    Moviment.create({
                        description: "TRANSFERENCIA",
                        route: destination.number,
                        amount: amount_destination,
                        observation: ''
                    })

    # Creditando o dinheiro no DESTINO
    Moviment.table_name = "moviment_#{destination.number}"
    Moviment.create({
                        description: "RECEBIDO",
                        route: origin.number,
                        amount: amount,
                        observation: ''
                    })
  end
end