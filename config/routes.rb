Rails.application.routes.draw do
  root 'sessions#welcome'
  #get '/signup' => 'users#new'
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  delete '/logout' => 'sessions#destroy'
  get '/auth/google_oauth2/callback' => 'sessions#google_login'
  resources :jobsites
  resources :companies

  resources :users do
    resources :jobsites, only:[:index, :new, :show, :create]
    resources :companies, only:[:index, :new, :show, :create]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end


# nested routes 
# scope method
