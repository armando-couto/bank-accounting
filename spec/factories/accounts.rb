FactoryBot.define do
  factory :account do

    balance {Faker::Number.decimal}
    number {Faker::Bank.account_number}
    client factory: :client

  end
end
