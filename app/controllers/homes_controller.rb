class HomesController < ApplicationController
	def index
		@categories = Category.all
		@items = Item.all.where.not(state: 'archived')
	end
end