Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'welcome#index'
  resources :boba_teas
  resources :teahouses
  resources :requests
  
  # resources :teahouses do 
  #   resources :boba_teas, controller: 'teahouse_boba_teas', only: [:index, :new, :create]
  # end 
  # resources :requests do 
  #   resources :boba_teas, controller: 'boba_tea_requests', only: [:index, :new, :create]
  # end 

  get '/teahouses/:id/boba_teas', to: 'teahouse_boba_teas#index', as: 'teahouse_boba_teas'
  get '/teahouses/:id/boba_teas/new', to: 'teahouse_boba_teas#new', as: 'new_teahouse_boba_teas'
  post '/teahouses/:id/boba_teas', to: 'teahouse_boba_teas#create'
  
  get '/requests/:id/boba_teas', to: 'boba_tea_requests#index', as: 'boba_tea_requests'
  get '/requests/:id/boba_teas/new', to: 'boba_tea_requests#new', as: 'new_boba_tea_requests'
  post '/requests/:id/boba_teas', to: 'boba_tea_requests#create'
end
