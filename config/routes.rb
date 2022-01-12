Rails.application.routes.draw do
  # devise_for :agents
  resources :properties 
  get 'home/index'
  root "home#index"
  get 'home/about'
  
  devise_for :agents, controllers: {
    registrations: 'agents/registrations',
    # get '/agents/sign_up(.:format)' => "devise/registrations#new"
    sessions: 'agents/sessions'
    }
  
    resources :companies
    resources :invitations
    resources :lock_codes
    resources :smart_locks
    
    resources :agents
    # devise_scope :agent do
    #   get '/agents/sign_out' => 'devise/sessions#destroy'
    # end
  # root to: "home#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
