Rails.application.routes.draw do

  resources :recipe do 
    resources :ingredient
    resources :direction
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users do 
    resources :ingredient
  end

    controller :sessions do
     get "/sign_in" => :new
     post "/sign_in" => :create
     get "/sign_out" => :destroy
    end

    controller :users do 
      get "/sign_up" => :new
      post "/sign_up" => :create
    end


  root "welcome#index"
end
