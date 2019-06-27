module ControllersHelper
  def not_found
    render json: {error: 'not_found'}
  end

  def authorize_request
    header = request.headers['Authorization']
    header = header.split(' ').last if header
    begin
      @decoded = JsonWebToken.decode(header)
      @current_client = Client.find(@decoded[:client_id])
    rescue ActiveRecord::RecordNotFound => e
      render json: {errors: e.message}, status: :unauthorized
    rescue JWT::DecodeError => e
      render json: {errors: e.message}, status: :unauthorized
    end
  end

  def self.auth email, password
    @client = Client.find_by_email(email)
    if @client&.authenticate(password)
      token = JsonWebToken.encode(client_id: @client.id)
      time = Time.now + 24.hours.to_i
      return {token: token, exp: time.strftime("%m-%d-%Y %H:%M"), name: @client.name}
    else
      return {error: 'unauthorized'}
    end
  end
end