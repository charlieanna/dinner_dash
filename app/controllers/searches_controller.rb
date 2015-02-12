class SearchesController < ApplicationController
	def create
		@items = Item.search_by_title(params[:search][:search])
		ap @items
		render 'show'
	end
end