Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check
get "tweets/star" => "tweets#star"
get "tweets/recommend" => "tweets#recommend"
get "tweets/schedule" => "tweets#schedule"
get "tweets/top" => "tweets#top"
  # Defines the root path route ("/")
  # root "posts#index"
  resources :users, only: [:show]
  resources :tweets do
    resources :likes, only: [:create, :destroy]
  end
  root 'tweets#top'
end