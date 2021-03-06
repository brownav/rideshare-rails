Rails.application.routes.draw do

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :drivers do
    resources :trips, only: [:show, :destroy]
  end

  resources :passengers do
    resources :trips, only: [:show, :destroy, :new]
  end

  resources :trips

  root 'trips#index'

end
