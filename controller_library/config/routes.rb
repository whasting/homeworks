Rails.application.routes.draw do
  get 'books/new.html.erb', to: 'books#new'

  resources :books, only: [:new, :create, :index, :destroy]
end
