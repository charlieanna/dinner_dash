class SearchesController < ApplicationController
	def create
		@items = Item.search_by_full_text(params[:search][:search])
		render 'show'
	end
end