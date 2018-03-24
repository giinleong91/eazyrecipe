Rails.application.routes.draw do

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  resources :users do 
    resources :fridges do
      member do 
        patch :done
      end
    end
  end

  resources :recipes do 
    resources :ingredient
    resources :direction
  end

  resources :sessions

  get "/sign_up" => "users#new"
  get "/sign_in" => "sessions#new"
  get "/sign_out" => "sessions#destroy"


  root "recipes#index"
end
