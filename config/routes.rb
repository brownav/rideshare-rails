Rails.application.routes.draw do

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :trips

  resources :drivers do
    resources :trips, only: [:show, :edit, :destroy]
  end

  resources :passengers do
    resources :trips, only: [:show, :edit, :destroy, :new]
  end

  root 'trips#index'

end
