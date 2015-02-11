class ReviewsController < ApplicationController
  def index
    @reviews = Item.find(params[:item_id]).reviews
  end
end
