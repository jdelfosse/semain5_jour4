Rails.application.routes.draw do
  post '/registration/create', to: 'registration#create'  
  post '/registration/conexion', to: 'registration#conexion'
  get '/registration/deconexion', to: 'registration#deconexion'
  get '/registration/new', to: 'registration#new'

  post '/gossip/unlike/:id', to: 'gossip#unlike'
  post '/gossip/like/:id', to: 'gossip#like'
  post '/gossip/destroy/:id', to: 'gossip#destroy'
  post '/gossip/change/:id', to: 'gossip#change'
  post '/gossip/create', to: 'gossip#create'
  get '/gossip/edit/:id', to: 'gossip#edit'
  get '/gossip/new', to: 'gossip#newgossip'
  get '/gossip/gestion', to: 'gossip#gestion'
  get '/gossip', to: 'gossip#view'
  get '/gossip/:id', to: 'gossip#index'
  get '/', to: 'gossip#redirect'
end
