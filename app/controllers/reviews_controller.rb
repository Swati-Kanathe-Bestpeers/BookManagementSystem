class ReviewsController < ApplicationController
  def index
    @reviews = Review.all.order("ID ASC")
  end

  def new
    @review = Review.find(params[:id])
  end

  def edit
    @review = Review.find(params[:id])
  end

  def show
    @review = Review.find(params[:id])
  end

  def create
    @review = Review.find(params[:id])
    if @review.after_save
      redirect_to reviews_path
    else
      render 'new'
    end
  end

  def update
    @review = Review.find(params[:id])
    @review.update(review_param)
    redirect_to reviews_path
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy(review_param)
    redirect_to reviews_path
  end
  private
  def review_param
    params.require(:review).permit(:rating, :state)
  end
end
