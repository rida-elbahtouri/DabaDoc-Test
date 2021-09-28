Rails.application.routes.draw do
  resources :favorites
  resources :answers
  resources :questions
  devise_for :users,
             controllers: {
               registrations: :registrations,
               sessions: :sessions
             }
  get '/checkToken', to:"token#checkToken"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
