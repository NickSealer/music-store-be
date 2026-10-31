Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :items
      get '/colors', to: 'items#colors', format: :json
    end
  end
end
