module Api::V1
  class ClientsController < ApplicationController
    before_action :authorize_request
    before_action :find_client, except: %i[index]

    # GET /clients
    def index
      @clients = Client.all
      render json: @clients.to_json(:include => :account), status: :ok
    end

    # GET /clients/{id}
    def show
      render json: @client.to_json(:include => :account), status: :ok
    end

    private

    def find_client
      @client = Client.find_by_id!(params[:id])
    rescue ActiveRecord::RecordNotFound
      render json: {errors: 'Client not found'}, status: :not_found
    end
  end
end
