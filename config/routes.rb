Rails.application.routes.draw do
  namespace :v1, defaults: { format: :json } do
    resources :users, only: :create
    resource :clock_ins, only: :create
  end
end
