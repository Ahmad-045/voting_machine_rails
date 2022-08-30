Rails.application.routes.draw do
  devise_for :users
  resources :users do
    resource :candidate
  end

  resources :halka
  resources :election

  root 'home#index'
  get '/users/:id/cast_vote', to: 'vote#add', as: 'add_vote'
  get '/halka_voters', to: 'users#halka_voters', as: 'halka_voters'
  get 'users/show_voters/:id', to: 'users#show_voters', as: 'show_voters'
  get '/votes', to: 'candidates#votes', as: 'votes'
  get 'show_results', to: 'vote#index', as: 'show_results'

end
