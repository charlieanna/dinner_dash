class SalesController < ApplicationController
  def show
  	@categories = Category.where.not(sale: nil)
  	@items = Item.where.not(sale: nil)
  end
end
