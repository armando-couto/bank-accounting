class Account < ApplicationRecord
  belongs_to :client
  before_create :create_historic

  def create_historic
    number = self.number
    ActiveRecord::Schema.define do
      create_table "historic_" + number, force: :cascade do |t|
        t.string "description"
        t.string "type"
        t.decimal "amount", :precision => 4
        t.string "observation"
        t.datetime "created_at", null: false
      end
    end
  end
end
