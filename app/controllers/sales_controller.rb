class SalesController < ApplicationController
  def show
  	@categories = Category.where.not(sale: nil)
  	@items = Item.where.not(sale: nil)
  end

  def new
  end

  def create
  	sale = Sale.create(sale_params)
    categories = Category.where id: params[:sale][:category_ids]
    categories.each do |category|
    	category.update_attributes(sale: sale)
    	category.items.each do |item|
    		item.update_attributes(sale: sale)
    	end
    end
    if sale
      redirect_to sales_path, alert: 'Sale has been created.'
    else
      redirect_to root_path, alert: sale.errors
    end
  end

  private

  def sale_params
    params.require(:sale).permit(:name, :discount, :category_ids )
  end
end
