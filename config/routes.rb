Rails.application.routes.draw do
  root 'documents#index'
  post 'documents', to: 'documents#create', as: :documents
end
