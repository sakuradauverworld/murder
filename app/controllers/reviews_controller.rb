class ReviewsController < ApplicationController
  before_action :move_to_index, only: [:new, :create]
  def new
    @post = Post.find(params[:post_id])
    @review = Review.new
  end

  def create

    @post = Post.find(params[:post_id])
    @review = Review.create(create_params)
    @review = Review.create(rate: create_params[:rate], review: create_params[:review], post_id: params[:post_id], user_id: current_user.id)
  
    if @review.save
      redirect_to show_path(@post)
    end
  end

  private
  def create_params
    params.require(:review).permit(:rate, :review)
  end
end
