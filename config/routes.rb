Rails.application.routes.draw do
  devise_for :users
  resources :users do
    resource :candidate
  end
  resources :halka
  resource :election
  root 'home#index'
  get '/users/:id/cast_vote', to: 'vote#add', as: 'add_vote'

end
