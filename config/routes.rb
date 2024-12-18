Rails.application.routes.draw do

  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  get 'my_posts', to: 'posts#my_posts'
  get 'my_appointments', to: 'appointments#my_appointments'
  resources :posts do
    collection do
      get 'search_suggestions'
    end
    resources :reviews, only: [:create, :destroy]
    resources :question_answers, only: [:index, :new, :create]
  end

  resources :appointments do
    member do
      patch :confirm
    end
  end

  resources :questions, only: [:index, :create]
  resources :appointments, only: [:index, :new, :show, :create, :destroy]
  # Defines the root path route ("/")
  # root "posts#index"
  get 'about', to: 'pages#about'
  resources :users, only: [:show, :edit, :update]
end
