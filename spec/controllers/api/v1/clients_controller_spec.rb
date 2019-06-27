require 'rails_helper'
require 'support/controllers_helper'

RSpec.configure do |c|
  c.include ControllersHelper
end

RSpec.describe Api::V1::ClientsController, :type => :controller do

  client = FactoryBot.create(:client)
  authentication = ControllersHelper.auth(client.email, client.password)

  describe 'GET #index' do
    context 'when you return all clients' do
      it 'returns http success' do
        request.headers.merge!({"Authorization" => authentication[:token]})
        get :index, params: {}
        expect(response).to have_http_status(:success)
      end
    end
  end
end
