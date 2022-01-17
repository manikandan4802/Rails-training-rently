Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # devise_for :agents
  # resources :agents

  # devise_scope :agent do
  #   delete '/agents/sign_out' => 'sessions#destroy'
  # end
  
  resources :properties 
    # resources :invitation do
  get 'home/index'
  root "home#index"
  get 'home/about'
  get 'home/about'
  
  devise_for :agents, controllers: {
    registrations: 'agents/registrations',
    # sign_out: 'agents/sessions',
    # get '/agents/sign_up(.:format)' => "devise/registrations#new"
    sessions: 'agents/sessions'
    }

    

  resources :agents do
    # get :mf_export_types, :on => :collection
    # get :destroy, :on => :member
    patch '/agents/:id/edit', to: 'agents#edit' # destroy
    post :create, :on => :member
    get :new, :on => :member
    get :show, :on => :member
    get :index, :on => :collection
  end

  
  
    resources :companies
    resources :invitations
    resources :lock_codes
    resources :smart_locks
    
    #
    
    
  # root to: "home#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
