class PostsController < ApplicationController
  before_action :authenticate_user,{only:[:new,:create]}
  def index
    @posts = Post.order("created_at DESC").page(params[:page]).per(5)
  end

  def new
   @post = Post.new
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
 
 
  
 
end
