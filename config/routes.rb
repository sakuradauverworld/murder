Rails.application.routes.draw do
  devise_for :users
  get '/' => 'posts#index'
  get 'posts/new'  => 'posts#new'
  get '/posts/:post_id/reviews' => 'posts#show',as: :show
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
