class Client < ApplicationRecord
  has_secure_password
  has_one :account
  validates :email, presence: true, uniqueness: true
  validates :email, format: {with: URI::MailTo::EMAIL_REGEXP}
  validates :password, length: {minimum: 6}, if: -> {new_record? || !password.nil?}
end