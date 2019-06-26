require 'rails_helper'
require 'spec_helper'

RSpec.describe Client, type: :model do
  let(:client) {build(:client)}

  describe 'ActiveModel validations' do
    it {is_expected.to validate_presence_of(:name)}
    it {is_expected.to validate_presence_of(:cpf)}
    it {is_expected.to validate_presence_of(:email)}
  end
end