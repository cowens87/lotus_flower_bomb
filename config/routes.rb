Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'welcome#index'
  resources :teahouses
  resources :boba_teas
  get '/teahouses/:id/boba_teas', to: 'teahouse_boba_teas#index', as: 'teahouse_boba_teas'
  get '/teahouses/:id/boba_teas/new', to: 'teahouse_boba_teas#new', as: 'new_teahouse_boba_teas'
  post '/teahouses/:id/boba_teas', to: 'teahouse_boba_teas#create'
end
