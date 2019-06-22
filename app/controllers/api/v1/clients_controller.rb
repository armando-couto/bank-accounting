module Api::V1
  class ClientsController < ApplicationController
    before_action :authorize_request
    before_action :find_client, except: %i[create index]

    # GET /clients
    def index
      @clients = Client.all
      render json: @clients, status: :ok
    end

    # GET /clients/{id}
    def show
      render json: @client, status: :ok
    end

    # POST /clients
    def create
      @client = Client.new(client_params)
      if @client.save
        render json: @client, status: :created
      else
        render json: {errors: @client.errors.full_messages}, status: :unprocessable_entity
      end
    end

    # PUT /clients/{id}
    def update
      unless @client.update(client_params)
        render json: {errors: @client.errors.full_messages}, status: :unprocessable_entity
      end
    end

    # DELETE /clients/{id}
    def destroy
      @client.destroy
    end

    private

    def find_client
      @client = Client.find_by_id!(params[:id])
    rescue ActiveRecord::RecordNotFound
      render json: {errors: 'Client not found'}, status: :not_found
    end

    def client_params
      params.permit(:name, :email, :password, :password_confirmation)
    end
  end
end
