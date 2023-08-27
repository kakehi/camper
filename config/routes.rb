Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  ## Organizations
  get 'organizations/new', to: 'organizations#new', as: 'new_organization'

  ## Camps
  get 'camps/new', to: 'camps#new', as: 'new_camp'

  ## Activities
  get 'activities/new', to: 'activities#new', as: 'new_activity'

end
