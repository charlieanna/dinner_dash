class SearchesController < ApplicationController
	def create
		if params[:order_id]
		  order = Order.find(params[:order_id])
		  line_items = order.line_items
		  items = line_items.collect { |line_item| line_item.item }
		  @items = items.search_by_full_text(params[:search][:search])
		else
			@items = Item.search_by_full_text(params[:search][:search])
		end
		render 'show'
	end
end