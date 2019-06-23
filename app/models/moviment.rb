class Moviment < ApplicationRecord
  before_create :recalculates_balance

  private

  def recalculates_balance

  end
end