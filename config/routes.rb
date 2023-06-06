Rails.application.routes.draw do
  namespace :v1, defaults: { format: :json } do
    resources :users, only: [ :create, :index ]
    resources :clock_ins, only: [ :create, :index ]
    resources :user_followers, only: [ :create, :index ]
    put "user_followers/unfollow/:following_id" => 'user_followers#unfollow'
  end
end
