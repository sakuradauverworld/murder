class ReviewsController < ApplicationController

  def new
    @post = Post.new
  end

  def create
    @reviews = Review.create(nickname: params[:nickname],rate: params[:rate],review: params[:review] ,post_id: params[:post_id])
   if @reviews.save
    redirect_to "/" 
   end
  
  end

  def show
    @post = Post.find_by(id: params[:id])
    @reviews = Review.all
  end
  
end
