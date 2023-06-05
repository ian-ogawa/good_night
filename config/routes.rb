Rails.application.routes.draw do
  resources :user_followers
  namespace :v1, defaults: { format: :json } do
    resources :users, only: :create
    resources :clock_ins, only: [ :create, :index ]
  end
end
