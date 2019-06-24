module Api::V1
  class AccountsController < ApplicationController
    before_action :authorize_request
    before_action :find_account

    # POST /balance
    def balance
      render json: {:balance => @account.balance}, status: :ok
    end

    private

    def find_account
      if params[:id].nil?
        @account = Account.find_by_number!(params[:number])
      else
        @account = Account.find_by_id!(params[:id])
      end
    rescue ActiveRecord::RecordNotFound
      render json: {errors: 'Account does not exist.'}, status: :not_found
    end
  end
end