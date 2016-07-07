Rails.application.routes.draw do
  
  devise_for :residents
  # devise_for :users
  root to: 'home#index'

  namespace :api do 
  	namespace :v1 do 
      mount_devise_token_auth_for 'User', at: 'auth'

      mount_devise_token_auth_for 'Resident', at: 'resident_auth'
      as :resident do
        # Define routes for Resident within this block.
      end
  		resources :users, only: [] do 
  			resources :residents, only: [:index]
  		end
      devise_scope :resident do 
        resources :residents, only: [:show]
      end
  	end
  end
end
