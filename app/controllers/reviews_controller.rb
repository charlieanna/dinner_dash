class ReviewsController < ApplicationController
  def index
    @reviews = Item.find(params[:item_id]).reviews
  end

  def new
    item = Item.find(params[:item_id])
    @review = item.reviews.build
  end

  def create
    item = Item.find(params[:item_id])
    review = item.reviews.create(review_params)
    review.user = current_user
    review.save
    redirect_to item_reviews_path(item)
  end

  def edit
    @review = Review.find(params[:id])
  end

  def update
    @review = Review.find(params[:id])
    @review.update_attributes(review_params)
    redirect_to item_reviews_path, alert: 'Review has been updated'
  end

  private

  def review_params
    params.require(:review).permit(:title, :body, :stars)
  end
end
