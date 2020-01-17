Rails.application.routes.draw do
  devise_for :users
  get '/' => 'posts#index'
  get 'posts/new'  => 'posts#new'
  post 'posts/create' => 'posts#create'
  get 'posts/:id' => 'posts#show'
  post 'posts/:id' => 'posts#show'
  post 'reviews/create' => 'reviews#create'
  resources :posts, only: :show do
    resources :reviews, only: [:new, :create]
    collection do
      get 'search'
    end
  end
end
