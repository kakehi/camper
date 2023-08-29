Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "organizations#index"

  ## Organizations
  get 'organizations', to: 'organizations#index', as: 'index_organization'
  get 'organizations/new', to: 'organizations#new', as: 'new_organization'
  post 'organizations/new', to: 'organizations#create', as: 'create_organization'
  get 'organizations/edit/:id', to: 'organizations#edit', as: 'edit_organization'
  post 'organizations/edit/:id', to: 'organizations#edit', as: 'update_organization'

  ## Camps
  get 'camps/new', to: 'camps#new', as: 'new_camp'
  post 'camps/new', to: 'camps#create', as: 'create_camp'
  get 'camps/edit/:id', to: 'camps#edit', as: 'edit_camp'
  post 'camps/edit/:id', to: 'camps#edit', as: 'update_camp'

  ## Activities
  get 'activities/new', to: 'activities#new', as: 'new_activity'
  post 'activities/new', to: 'activities#create', as: 'create_activity'
  get 'activities/edit/:id', to: 'activities#edit', as: 'edit_activity'
  post 'activities/edit/:id', to: 'activities#edit', as: 'update_activity'

end
