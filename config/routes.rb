Rails.application.routes.draw do
  get '/' => 'posts#index'
  get 'posts/new'  => 'posts#new'
  post 'posts/create' => 'posts#create'
end
