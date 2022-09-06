# frozen_string_literal: true

Rails.application.routes.draw do
  root 'home#index'

  devise_for :users

  resources :users do
    resource :candidate, only: %i[new create update]
    get 'halka_voters', on: :collection
    get 'show_voters', on: :member
  end

  resources :halka, only: %i[index new create destroy]
  resources :election
  resources :vote

  get '/users/:id/cast_vote', to: 'vote#add', as: 'add_vote'
end
