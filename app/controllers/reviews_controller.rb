class ReviewsController < ApplicationController

  def new
    @post = Post.find(params[:post_id])
    @review = Review.new
  end

  def create
    @post = Post.find(params[:post_id])
    @review = Review.create(create_params)
    if @review.save
      redirect_to show_path(@post)
    end
  end

  private
  def create_params
    params.require(:review).permit(:nickname, :rate, :review).merge(post_id: params[:post_id])
  end
end
