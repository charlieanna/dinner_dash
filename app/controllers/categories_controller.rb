class CategoriesController < ApplicationController
	def show
		category = Category.find(params[:id])
    @items = category.items
	end

	def new
		@category = Category.new
	end

	def index
		@category = Category.all
	end

  def create
  	category = Category.create(category_params)
  	redirect_to categories_path, alert: 'Category has been created'
  end

  private

  def category_params
    params.require(:category).permit(:title)
  end
end