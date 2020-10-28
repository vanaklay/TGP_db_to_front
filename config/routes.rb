Rails.application.routes.draw do
  root 'gossips#index'
  get '/contact', to: 'index#contact'
  get '/team', to: 'index#team'
  get '/welcome/:name', to: 'index#welcome'

  resources :gossips do
    resources :comments
  end
  resources :users
  resources :cities, only: [:index, :show]
end
