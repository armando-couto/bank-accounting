Rails.application.routes.draw do
  # get '/*a', to: 'application#not_found'

  namespace 'api' do
    namespace 'v1' do
      post '/auth', to: 'authentication#login'

      resources :clients
    end
  end
end