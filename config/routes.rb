Rails.application.routes.draw do
  
  devise_for :students, controllers: {
  :sessions  =>    'students/sessions',
  :passwords   =>  'students/passwords',
  :registrations => 'students/registrations'
}
  resources :students, only: [:show]
  
  resources :jobs

  root :to => "pages#index"
  
  devise_for :farmers, controllers: { 
    omniauth_callbacks: 'farmers/omniauth_callbacks', 
    :registrations => 'registrations' 
  }
  
  resources :farmers, only: [:show]
  
  resources :jobs do 
    resources :reservations, only: [:create]
  end
  
  get "/farmers/:id/jobs" => "farmers#jobs", as:"farmer_jobs"
  get '/reservations' => 'reservations#index'
  get '/search' => 'pages#search'
  
end
