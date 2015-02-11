class ItemsController < ApplicationController
	before_action :authorize_admin!
	def index
		@items = Item.all
	end

	def edit
		@item = Item.find(params[:id])
	end

	def new
		@item = Item.new
	end

	def update
		categories = Category.where id: params[:item][:category_ids]
		item = Item.find(params[:id])
    item.update_attributes(item_params)
    item.categories = categories
    item.save
    redirect_to items_path, alert: "Item has been updated"
	end

	def create
		item = Item.create(item_params)
		categories = Category.where id: params[:item][:category_ids]
		item.update_attributes(item_params)
    item.categories = categories
    item.save
		if item 
			redirect_to items_path, alert: "A new item has been created."
		else
			redirect_to root_path, alert: item.errors
		end
	end

	def archive
		item = Item.find(params[:id])
		item.update_attributes(state: "archived")
		redirect_to items_path, alert: "Item has been archived"
	end

	private

	def item_params
    params.require(:item).permit(:title, :description, :price, :photo, :category_ids)
	end

  def authorize_admin!
    require_signin!
    unless current_user.admin?
      flash[:alert] = "You must be an admin to do that."
      redirect_to root_path
    end
  end
end