Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  get '/', to: 'organizations#index', as: 'index_organization'

  ## Profile
  get 'profile/:id', to: 'profiles#detail', as: 'detail_profile'

  get 'profile/z8opKTG2XA/:user_id/new', to: 'profiles#new', as: 'new_profile'
  post 'profile/z8opKTG2XA/:user_id/new', to: 'profiles#create', as: 'create_profile'

  get 'profile/edit/:id', to: 'profiles#edit', as: 'edit_profile'
  post 'profile/edit/:id', to: 'profiles#update', as: 'update_profile'

  get 'profile/destroy/:id', to: 'profiles#destroy'
  delete 'profile/destroy/:id', to: 'profiles#destroy', as: 'destroy_profile'

  ## Organizations
  get 'organizations/new', to: 'organizations#new', as: 'new_organization'
  post 'organizations/new', to: 'organizations#create', as: 'create_organization'
  get 'organizations/edit/:id', to: 'organizations#edit', as: 'edit_organization'
  post 'organizations/edit/:id', to: 'organizations#update', as: 'update_organization'
  get 'organizations/destroy/:id', to: 'organizations#destroy'
  delete 'organizations/destroy/:id', to: 'organizations#destroy', as: 'destroy_organization'

  ## Camps
  get 'camps', to: 'camps#index', as: 'index_camp'
  
  get 'organizations/:organization_id/camps', to: 'camps#index', as: 'index_organization_camp'
  
  get 'organizations/:organization_id/camps/new', to: 'camps#new', as: 'new_camp'
  post 'organizations/:organization_id/camps/new', to: 'camps#create', as: 'create_camp'

  get 'organizations/:organization_id/camps/edit/:id', to: 'camps#edit', as: 'edit_camp'
  post 'organizations/:organization_id/camps/edit/:id', to: 'camps#update', as: 'update_camp'


  get 'organizations/:organization_id/camps/duplicate/:id', to: 'camps#duplicate', as: 'duplicate_camp'

  get 'organizations/:organization_id/camps/destroy/:id', to: 'camps#destroy'
  delete 'organizations/:organization_id/camps/destroy/:id', to: 'camps#destroy', as: 'destroy_camp'

  ## Activities
  get 'activities', to: 'activities#index', as: 'index_activity'

  get 'organizations/:organization_id/camps/:camp_id/activities', to: 'activities#index', as: 'index_camp_activities'

  get 'organizations/:organization_id/camps/:camp_id/activities/new', to: 'activities#new', as: 'new_activity'
  post 'organizations/:organization_id/camps/:camp_id/activities/new', to: 'activities#create', as: 'create_activity'

  get 'organizations/:organization_id/camps/:camp_id/activities/edit/:id', to: 'activities#edit', as: 'edit_activity'
  post 'organizations/:organization_id/camps/:camp_id/activities/edit/:id', to: 'activities#update', as: 'update_activity'

  get 'organizations/:organization_id/camps/:camp_id/activities/duplicate/:id', to: 'activities#duplicate', as: 'duplicate_activity'

  get 'organizations/:organization_id/camps/:camp_id/activities/destroy/:id', to: 'activities#destroy'
  delete 'organizations/:organization_id/camps/:camp_id/activities/destroy/:id', to: 'activities#destroy', as: 'destroy_activity'
  

  ## Tags
  get 'tags', to: 'tags#index', as: 'index_tag'

  get 'tags/new', to: 'tags#new', as: 'new_tag'
  post 'tags/new', to: 'tags#create', as: 'create_tag'

end
