module Api::V1
  class AccountsController < ApplicationController
    before_action :authorize_request
    before_action :find_account, :except => [:transference]

    # GET /balance
    def balance
      render json: {:balance => @account.balance}, status: :ok
    end

    # POST /transference
    def transference
      origin_account = Account.find_by_id(params[:origin_account_id])
      if origin_account.nil?
        render json: {error: 'Origin account not exist.'}, status: :not_found
        return
      end

      destination_account = Account.find_by_id(params[:destination_account_id])
      if destination_account.nil?
        render json: {error: 'Destination account not exist.'}, status: :not_found
        return
      end

      if params[:amount].nil? || params[:amount].to_f <= 0
        render json: {error: 'Amount must be greater than 0.'}, status: :not_found
        return
      end

      amount = params[:amount].to_f * -1
      if origin_account.check_not_limit amount
        render json: {error: "Account has not limit, limit disponible: #{origin_account.balance}."}, status: :not_acceptable
        return
      end

      # # Retirando o dinheiro da ORIGEM
      Moviment.table_name = "moviment_#{origin_account.number}"
      Moviment.create_debit destination_account.number, amount

      # # Creditando o dinheiro no DESTINO
      Moviment.table_name = "moviment_#{destination_account.number}"
      Moviment.create_credit origin_account.number, params[:amount].to_f # Nao usa a variavel, por que aqui preciso do valor sendo positivo

      render json: {message: 'Transfer completed successfully.'}, status: :ok
    end

    private

    def find_account
      @account = Account.find_by_id!(params[:id])
    rescue ActiveRecord::RecordNotFound
      render json: {error: 'Account does not exist.'}, status: :not_found
    end
  end
end