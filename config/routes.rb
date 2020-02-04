Rails.application.routes.draw do
  devise_for :users
  get '/' => 'posts#index'
  get 'posts/new'  => 'posts#new'
  post 'posts/create' => 'posts#create'
  get 'posts/:id' => 'posts#show'
  post 'posts/:id' => 'posts#show'
  post 'reviews/create' => 'reviews#create'
  get '/posts/:post_id/reviews' => 'posts#show',as: :show
  get 'reviews/new' => 'reviews#new'
  post 'posts/:id/destroy' => 'posts#destroy'
  post "reviews/:id/update" => "reviews#update"
  post 'reviews/:id/destroy' => 'reviews#destroy'
  resources :posts, only: :show do
    resources :reviews, only: [:new, :create]
    collection do
      get 'search'
    end
  end

  resources :posts  
  resources :users  
  resources :reviews 
end
