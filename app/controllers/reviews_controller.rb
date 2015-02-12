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

  private

  def review_params
    params.require(:review).permit(:title, :body, :stars)
  end
end
