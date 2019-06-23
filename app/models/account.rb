class Account < ApplicationRecord
  belongs_to :client
  before_create :create_historic
  validates :number, presence: true, uniqueness: true

  private

  def create_historic
    number = self.number
    ActiveRecord::Schema.define do
      create_table "moviment_" + number, force: :cascade do |t|
        t.string "description"
        t.string "source"
        t.string "destination"
        t.decimal "amount", :precision => 10, :scale => 4
        t.string "observation"
        t.datetime "created_at", null: false
      end
    end
  end
end
