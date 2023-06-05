Rails.application.routes.draw do
  namespace :v1, defaults: { format: :json } do
    resources :users, only: :create
    resources :clock_ins, only: [ :create, :index ]
  end
end
