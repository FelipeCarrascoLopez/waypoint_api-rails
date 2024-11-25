require 'sidekiq/web'

Rails.application.routes.draw do
  # Montar Sidekiq::Web sin autenticación
  mount Sidekiq::Web => '/sidekiq'

  # Otras rutas
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'

  namespace :api do
    namespace :v1 do
      resources :gps, only: [:create]
    end
  end
end
