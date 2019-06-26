require 'rails_helper'
require 'support/controllers_helper'

RSpec.describe Api::V1::AuthenticationController do
  let!(:client) {FactoryBot.create(:client)}

  describe 'POST #auth' do
    describe 'with correct credentials' do
      let!(:auth) {post :auth, params: {email: client.email, password: '123456'}}

      it 'returns http success' do
        expect(response).to have_http_status(:success)
      end

      it 'returns JWT' do
        expect(JSON.parse(response.body).keys).to match(%w[token exp name])
      end
    end

    describe 'with incorrect credentials' do
      let!(:auth) {post :auth, params: {email: client.email, password: '12345'}}

      it 'returns http success' do
        expect(response).to have_http_status(:unauthorized)
      end

      it 'returns credentials error' do
        expect(JSON.parse(response.body).keys).to match(%w[error])
      end
    end
  end
end
