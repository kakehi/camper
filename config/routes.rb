

Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  get '/', to: 'organizations#index', as: 'index_organization'

  ## Profile
  get 'profile/:id/schedule', to: 'profiles#schedule', as: 'profile_schedule'
  get 'profile/:id/detail', to: 'profiles#detail', as: 'profile_detail'
  get 'profile/:id/favorite-organizations', to: 'profiles#favorite_organizations', as: 'profile_favorite_organizations'

  get 'profile/z8opKTG2XA/:user_id/new', to: 'profiles#new', as: 'profile_new'
  post 'profile/z8opKTG2XA/:user_id/new', to: 'profiles#create', as: 'profile_create'

  get 'profile/edit/:user_id/:id', to: 'profiles#edit', as: 'profile_edit'
  post 'profile/edit/:user_id/:id', to: 'profiles#update', as: 'profile_update'

  get 'profile/destroy/:id', to: 'profiles#destroy'
  delete 'profile/destroy/:id', to: 'profiles#destroy', as: 'profile_destroy'

  ## Organizations
  get 'orgs/:id/profile', to: 'organizations#profile', as: 'org_profile'
  get 'orgs/:id/dashboard/camps/:camp_group_id/:tab_id', to: 'organizations#dashboard', as: 'org_dashboard'
  get 'orgs/new', to: 'organizations#new', as: 'new_organization'
  post 'orgs/new', to: 'organizations#create', as: 'create_organization'
  get 'orgs/edit/:id', to: 'organizations#edit', as: 'edit_organization'
  post 'orgs/edit/:id', to: 'organizations#update', as: 'update_organization'
  get 'orgs/destroy/:id', to: 'organizations#destroy'
  delete 'orgs/destroy/:id', to: 'organizations#destroy', as: 'destroy_organization'

  ## Camps
  get 'camps', to: 'camps#index', as: 'index_camp'
  
  get 'orgs/:organization_id/camps', to: 'camps#index', as: 'index_organization_camp'
  
  get 'orgs/:organization_id/camps/new/page/:page_id', to: 'camps#new', as: 'camp_new'
  post 'orgs/:organization_id/camps/new', to: 'camps#create', as: 'create_camp'

  get 'orgs/:organization_id/camps/edit/:id/page/:page_id', to: 'camps#edit', as: 'camp_edit'
  post 'orgs/:organization_id/camps/edit/:id', to: 'camps#update', as: 'update_camp'


  get 'camps/duplicate/:id', to: 'camps#duplicate', as: 'camp_duplicate'
  get 'orgs/:organization_id/camps/:camp_id/override/:id', to: 'camps#override_children', as: 'camp_override_children'

  get 'camps/destroy/:id', to: 'camps#destroy'
  delete 'camps/destroy/:id', to: 'camps#destroy', as: 'camp_destroy'

  get 'orgs/:organization_id/camps/:camp_id/overview', to: 'camps#overview', as: 'camp_profile_detail'

  ## Activities
  get 'activities', to: 'activities#index', as: 'index_activity'

  get 'orgs/:organization_id/camps/:camp_id/sessions', to: 'activities#index', as: 'index_camp_activities'

  get 'orgs/:organization_id/camps/:camp_id/sessions/new/page/:page_id', to: 'activities#new', as: 'activity_new'
  post 'orgs/:organization_id/camps/:camp_id/sessions/new', to: 'activities#create', as: 'create_activity'

  get 'orgs/:organization_id/camps/:camp_id/sessions/edit/:id/page/:page_id', to: 'activities#edit', as: 'activity_edit'
  post 'orgs/:organization_id/camps/:camp_id/sessions/edit/:id', to: 'activities#update', as: 'update_activity'

  get 'sessions/duplicate/:id', to: 'activities#duplicate', as: 'session_duplicate'

  get 'sessions/destroy/:id', to: 'activities#destroy'
  delete 'sessions/destroy/:id', to: 'activities#destroy', as: 'session_destroy'
  

  ## Tags
  get 'tags', to: 'tags#index', as: 'index_tag'

  get 'tags/new', to: 'tags#new', as: 'new_tag'
  post 'tags/new', to: 'tags#create', as: 'create_tag'

  get 'tags/edit/:id', to: 'tags#edit', as: 'edit_tag'
  post 'tags/edit/:id', to: 'tags#update', as: 'update_tag'

  ## FAVORITES
  resources :organizations do
    resource :favorite_organizations, only: [:create, :destroy]
  end

  post 'organizations/:organization_id/favorite-organizations(.:format)', to: 'favorite_organizations#create', as: 'create_favorite_organization'
  delete 'organizations/:organization_id/favorite-organizations(.:format)', to: 'favorite_organizations#destroy', as: 'destroy_favorite_organization'

  ## SCHEDULES
  resources :activities do
    resource :schedule_activities, only: [:create, :destroy]
  end

  post 'activities/:activity_id/schedule-activities(.:format)', to: 'schedule_activities#create', as: 'create_schedule_activity'
  delete 'activities/:activity_id/schedule-activities(.:format)', to: 'schedule_activities#destroy', as: 'destroy_schedule_activity'

end
