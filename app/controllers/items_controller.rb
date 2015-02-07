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
    item = Item.find(params[:id])
    item.update_attributes(item_params)
    redirect_to items_path, alert: "Item has been updated"
	end

	def create
		item = Item.create(item_params)
		redirect_to items_path, alert: "A new item has been created."
	end

	private

	def item_params
    params.require(:item).permit(:title, :description, :price, :photo)
	end

  def authorize_admin!
    require_signin!
    unless current_user.admin?
      flash[:alert] = "You must be an admin to do that."
      redirect_to root_path
    end
  end
end