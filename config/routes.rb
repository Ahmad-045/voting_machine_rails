# frozen_string_literal: true

Rails.application.routes.draw do
  root 'home#index'

  devise_for :users

  resources :users do
    resource :candidate, only: %i[new create update]
    get 'halka_voters', on: :collection # Route that show the all the voters in a specific halka
    get 'show_voters', on: :member   # Route to show the voters that casted their vote in the favor of any candidate (:id)
  end

  resources :halka, only: %i[index new create destroy]
  resources :election
  resources :vote

  get '/users/:id/cast_vote', to: 'vote#add', as: 'add_vote'
end
