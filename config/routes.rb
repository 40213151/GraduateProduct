Rails.application.routes.draw do
  
  devise_for :students, controllers: {
  :sessions  =>    'students/sessions',
  :passwords   =>  'students/passwords',
  :registrations => 'students/registrations'
}
  resources :students, only: [:show]
  
  resources :jobs
  
  resources :blogs

  root :to => "pages#index"
  
  devise_for :farmers, controllers: { 
    omniauth_callbacks: 'farmers/omniauth_callbacks', 
    :registrations => 'registrations' 
  }
  
  resources :farmers, only: [:show]
  
  resources :jobs do 
    resources :reservations, only: [:create]
  end
  
  resources :students do
    resources :reviews, only: [:create, :destroy]
  end
  
  get "/farmers/:id/jobs" => "farmers#jobs", as:"farmer_jobs"
  get "/farmers/:id/blogs" => "farmers#blogs", as:"farmer_blogs"
  get '/reservations' => 'reservations#index'
  get '/search' => 'pages#search'
  get '/room' => 'rooms#show'
  get '/ajaxsearch' => 'pages#ajaxsearch'
end
