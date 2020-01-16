class PostsController < ApplicationController

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
    @post = Post.find_by(id: params[:id])
    @reviews = Review.all

  end
 

 
end
