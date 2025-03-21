Rails.application.routes.draw do
  devise_for :users

  # Health status for monitoring
  get "up" => "rails/health#show", as: :rails_health_check

  # Custom routes
  get 'my_posts', to: 'posts#my_posts'
  get 'my_appointments', to: 'appointments#my_appointments'

  # Posts with nested resources
  resources :posts do
    collection do
      get 'search_suggestions'
    end
    resources :reviews, only: [:create, :destroy]
    resources :question_answers, only: [:index, :new, :create]
  end

  scope "(:locale)", locale: /en|es|de/ do
    root to: "pages#home"
    resources :posts
  end
  # Appointments with Stripe and confirmation actions
  resources :appointments do
    member do
      patch :confirm
      post :create_checkout_session
      get :payment_success
      get :payment_cancel
    end
  end

  # Questions resource
  resources :questions, only: [:index, :create]

  # Static pages
  get 'about', to: 'pages#about'

  # Users
  resources :users, only: [:show, :edit, :update]
end
