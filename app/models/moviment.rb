class Moviment < ApplicationRecord
  before_save :calcule_balance
  after_save :recalculates_balance

  def self.create_debit destination_account_number, amount
    Moviment.create({
                        description: "TRANSFERENCIA",
                        route: destination_account_number,
                        amount: amount,
                        observation: ''
                    })
  end

  def self.create_credit origin_account_number, amount
    Moviment.create({
                        description: "RECEBIDO",
                        route: origin_account_number,
                        amount: amount,
                        observation: ''
                    })
  end

  private

  def calcule_balance
    account = Account.find_by_number(account_number)
    raise ActiveRecord::Rollback if (account.balance + self.amount) < 0
  end

  def recalculates_balance
    account = Account.find_by_number(account_number)
    account.update({balance: Moviment.sum(:amount)})
  end

  def account_number
    Moviment.table_name.split("_")[1]
  end
end