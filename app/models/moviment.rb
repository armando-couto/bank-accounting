class Moviment < ApplicationRecord
  before_create :recalculates_balance

  private

  def recalculates_balance
    account = Account.find_by_number(account_number)
    account.update({balance: Moviment.sum(:amount)})
  end

  def account_number
    Moviment.table_name.split("_")[1]
  end
end