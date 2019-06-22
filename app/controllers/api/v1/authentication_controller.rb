module Api::V1
  class AuthenticationController < ApplicationController
    before_action :authorize_request, except: :login

    # POST /auth
    def login
      @client = Client.find_by_email(params[:email])
      if @client&.authenticate(params[:password])
        token = JsonWebToken.encode(client_id: @client.id)
        time = Time.now + 24.hours.to_i
        render json: {token: token, exp: time.strftime("%m-%d-%Y %H:%M"), name: @client.name}, status: :ok
      else
        render json: {error: 'unauthorized'}, status: :unauthorized
      end
    end

    private

    def login_params
      params.permit(:email, :password)
    end
  end
end
