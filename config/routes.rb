Rails.application.routes.draw do
  get 'trips/index'

  get 'trips/create'

  get 'trips/destory'

  get 'trips/edit'

  get 'trips/new'

  get 'trips/show'

  get 'passengers/index'

  get 'passengers/create'

  get 'passengers/destory'

  get 'passengers/edit'

  get 'passengers/new'

  get 'passengers/show'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :drivers
  resources :passengers
  resources :trips

  root 'trips#index'

end
