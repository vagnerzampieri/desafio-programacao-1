Rails.application.routes.draw do
  root 'documents#index'
  post 'documents', to: 'documents#create', as: :documents

  get "users/new"
  get "/auth/:provider/callback" => "sessions#create"
  get "/logout" => "sessions#destroy", :as => :logout
end
