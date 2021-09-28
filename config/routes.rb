Rails.application.routes.draw do
  resources :favorites
  resources :answers
  resources :questions

  get '/checkToken', to: 'token#checkToken'
  get '/activeUser', to: 'token#getUser'
  delete '/favorites', to: 'favorites#delete_from_fav'

  devise_for :users,
             controllers: {
               registrations: :registrations,
               sessions: :sessions
             }

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
