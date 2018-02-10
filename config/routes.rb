Rails.application.routes.draw do
  resources :aframes
  post 'aframes/random' => 'aframes#random'
  root 'aframes#new'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
