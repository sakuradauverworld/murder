class PostsController < ApplicationController
  before_action :move_to_index, except: :index

  def index
    @posts = Post.all
  end

  def new
   
  end


  def create
   @posts = Post.create(name: params[:name], image: params[:image])
    if@posts.save
      flash[:notice] = "投稿完了"
      redirect_to ("/")
    else
      render("posts/new")
    end
  end

  def show
    @post = Post.find(params[:post_id])
    @reviews = Review.all
  end
 
  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end
 
end
