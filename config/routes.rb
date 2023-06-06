Rails.application.routes.draw do
  namespace :v1, defaults: { format: :json } do
    resources :users, only: [ :create, :index ]
    resources :clock_ins, only: [ :create, :index ]
    resources :user_followers, only: :create
  end
end
