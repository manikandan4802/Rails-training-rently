Rails.application.routes.draw do
  # root "welcome#index"
  # use_doorkeeper
  # puts('comeing')
  # post '/oauth/token(.:format)' =>"doorkeeper/tokens#create"
  # puts ("crossed")
  # use_doorkeeper #do
  #   skip_controllers :authorizations, :applications, :authorized_applications
  #   # POST   '/oauth/token(.:format)' => "doorkeeper/tokens#create"
  # end
  use_doorkeeper do
    controllers tokens: :tokens
  end


  namespace 'api' do
    namespace 'v1' do
      resources :properties 
    end
  end
  post 'agents#create', action: :create, controller: :agents,:as => 'add_agents'
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # devise_for :agents
  # resources :agents

  # devise_scope :agent do
  #   delete '/agents/sign_out' => 'sessions#destroy'
  # end
  
  resources :properties do
    member do
      get 'assign_smart_lock'
      get 'detach_lock_box'
      post 'attach_lock_box'
    end
  end 
    # resources :invitation do
  
  root 'home#index'
  get 'home/about'
  get 'home/about'
  
  devise_for :agents, controllers: {
    registrations: 'agents/registrations',
    # sign_out: 'agents/sessions',
    # get '/agents/sign_up(.:format)' => "devise/registrations#new"
    sessions: 'agents/sessions'
    }

    

  resources :agents 

  
  
    resources :companies
    resources :invitations
    resources :lock_codes
    resources :smart_locks do
      member do
        # post attach
        # get home
      end
    end 
    
    #
    
    
  # root to: "home#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
