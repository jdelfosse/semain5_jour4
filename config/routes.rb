Rails.application.routes.draw do
  get '/registration/new', to: 'registration#new'

  post '/registration/create', to: 'registration#create'  
  post '/registration/conexion', to: 'registration#conexion'
  post '/registration/deconexion', to: 'registration#deconexion'

  get '/gossip/gestion', to: 'gossip#gestion'
  get '/gossip', to: 'gossip#view'
  get '/gossip/:id', to: 'gossip#index'
end
