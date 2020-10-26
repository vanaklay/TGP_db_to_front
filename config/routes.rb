Rails.application.routes.draw do
  get '/', to: 'index#home', as: 'index'
  get '/contact', to: 'index#contact'
  get '/team', to: 'index#team'
  get '/welcome/:name', to: 'index#welcome'
  get 'gossip/:id', to: 'index#gossip', as: 'gossip'
  get 'user/:id', to: 'index#user', as: 'user'
end
