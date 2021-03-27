# For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

Rails.application.routes.draw do
  get 'user', to: 'users#show'
  patch 'user', to: 'users#edit'

  post 'doctor', to: 'doctors#create'
  delete 'doctor', to: 'doctors#destroy'
  post 'doctor/verify', to: 'doctors#verify'

  post 'sign_in', to: 'sessions#create'
  post 'sign_up', to: 'registrations#create'
end
