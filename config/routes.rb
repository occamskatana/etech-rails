Rails.application.routes.draw do
  
  devise_for :residents
  # devise_for :users
  root to: 'home#index'

  namespace :api do 
  	namespace :v1 do 
      mount_devise_token_auth_for 'User', at: 'auth'
  		resources :users, only: [] do 
  			resources :residents, only: [:index]
  		end

      resources :residents, only: [:show]
  	end
  end
end
