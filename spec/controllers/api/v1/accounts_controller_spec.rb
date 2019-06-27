require 'rails_helper'

require 'support/controllers_helper'

RSpec.configure do |c|
  c.include ControllersHelper
end

RSpec.describe Api::V1::AccountsController do
  client = FactoryBot.create(:client)
  authentication = ControllersHelper.auth(client.email, client.password)

  describe 'GET #balance' do
    context 'when you return balance' do
      it 'returns http success' do
        request.headers.merge!({"Authorization" => authentication[:token]})

        match 'api/v1/balance/1' => 'api/v1/accounts#balance'
        expect(response).to have_http_status(:success)
      end
    end
  end
end