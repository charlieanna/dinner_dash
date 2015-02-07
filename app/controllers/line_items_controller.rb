class LineItemsController < ApplicationController
  include CurrentCart
  before_action :set_cart, only: [:create]
  before_action :set_line_item, only: [:show, :edit, :update, :destroy]
  def create
    item = Item.find(params[:item_id])
    @line_item = @cart.line_items.build(item: item)
    respond_to do |format|
      if @line_item.save
        format.html { redirect_to @line_item.cart, notice: 'Line item was successfully created.' }
        format.json { render action: 'show', status: :created, location: @line_item }
      else
        format.html { render action: 'new' }
        format.json { render json: @line_item.errors,
          status: :unprocessable_entity }
      end
    end
  end

  def destroy
  	@line_item.destroy
    redirect_to root_path, alert: "Item has been successfully removed"
  end

  private

  def set_line_item
  	@line_item = LineItem.find(params[:id])
  end
end