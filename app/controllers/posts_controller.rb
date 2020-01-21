class PostsController < ApplicationController
  before_action :move_to_index, only: [:new, :create]
  def index
    @post = Post.order("created_at DESC").page(params[:page]).per(5)
  end

  def new
   @post = Post.new
  end


  def create
   @posts = Post.create(name: params[:name], image: params[:image],user_id: current_user.id)
    if@posts.save
      redirect_to ("/")
    else
      flash[:notice] = "入力してください"
      render("posts/new")
    end
  end

  def show
    @post = Post.find(params[:post_id])
  end
 
end
