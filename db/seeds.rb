puts "Populando com dados"

50.times do
  User.create({
                  name: Faker::Name.name,
                  email: Faker::Internet.email,
                  password: "123456"
              })

  Account.create({
                     number: Faker::Bank.account_number,
                     name: Faker::Bank.name,
                 })
end