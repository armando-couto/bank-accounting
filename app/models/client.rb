class Client < ApplicationRecord
  has_secure_password
  before_create :create_account
  validates :email, presence: true, uniqueness: true
  validates :email, format: {with: URI::MailTo::EMAIL_REGEXP}
  validates :password, length: {minimum: 6}, if: -> {new_record? || !password.nil?}

  def create_account
    cpf = self.cpf
    ActiveRecord::Schema.define do
      create_table "account_" + cpf, force: :cascade do |t|
        t.string "number"
        t.string "name"
        t.datetime "created_at", null: false
        t.datetime "updated_at", null: false
      end
    end
  end
end