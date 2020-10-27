Rails.application.routes.draw do
  root 'index#home'
  get '/contact', to: 'index#contact'
  get '/team', to: 'index#team'
  get '/welcome/:name', to: 'index#welcome'
  get 'gossip/:id', to: 'index#gossip', as: 'gossip'
  get 'user/:id', to: 'index#user', as: 'user'



  resources :gossips
end
