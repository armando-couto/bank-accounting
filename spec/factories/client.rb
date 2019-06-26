FactoryBot.define do
  factory :client do

    name {Faker::Name.name}
    email {"#{Faker::Name.unique.first_name}@empresa.com.br"}
    password {"123456"}
    cpf {Faker::CPF.numeric}

  end
end