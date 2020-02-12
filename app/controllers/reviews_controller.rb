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
    else
      flash[:notice] = "入力してください"
      render :new
    end
  end

  def edit
    @review = Review.find_by(id: params[:id])
  end

  def update
    review = Review.find_by(id: params[:id])
    if review.user_id == current_user.id
    review.review = params[:review]
    review.save
    redirect_to ("/")
    end
  end

  def destroy
    review = Review.find(params[:id])
    if review.user_id == current_user.id
      review.destroy
      redirect_back(fallback_location: post_path)
    end
  end

  private
  def create_params
    params.require(:review).permit(:rate, :review)
  end
end
