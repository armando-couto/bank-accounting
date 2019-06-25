class Account < ApplicationRecord
  belongs_to :client
  before_create :create_moviment
  validates :number, presence: true, uniqueness: true

  def check_limit amount
    return true if (self.balance + amount) > 0
  end

  private

  def create_moviment
    number = self.number
    ActiveRecord::Schema.define do
      create_table "moviment_" + number, force: :cascade do |t|
        t.string "description"
        t.string "route"
        t.decimal "amount", :precision => 10, :scale => 4
        t.string "observation"
        t.datetime "created_at", null: false
      end
    end
  end
end
