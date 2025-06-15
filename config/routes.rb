Rails.application.routes.draw do
  resource :session
  resource :registration, only: %i[new create]
  resources :passwords, param: :token
  resources :rooms, except: %i[edit update] do
    resources :messages, only: %i[create]
  end

  get "up" => "rails/health#show", as: :rails_health_check

  root "rooms#index"
end
