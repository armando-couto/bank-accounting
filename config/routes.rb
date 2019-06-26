Rails.application.routes.draw do
  # get '/*a', to: 'application#not_found'

  namespace 'api' do
    namespace 'v1' do
      post '/auth', to: 'authentication#auth'
      get '/balance/:id', to: 'accounts#balance'
      post '/transference', to: 'accounts#transference'

      resources :clients
    end
  end
end