class SearchesController < ApplicationController
  def create
    if params[:search][:orders]
      orders = current_user.orders
      line_items = orders.collect(&:line_items)
      items = line_items.flatten.collect(&:item)
      ids = items.collect &:id
      @items = Item.where(id: ids).search_by_full_text(params[:search][:search])
    else
      @items = Item.search_by_full_text(params[:search][:search])
    end
    render 'show'
  end
end
