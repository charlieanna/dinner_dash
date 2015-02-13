class LineItemsController < ApplicationController
  include CurrentCart
  before_action :set_cart, only: [:create]
  before_action :set_line_item, only: [:show, :edit, :update, :destroy]
  def create
    @line_item = @cart.line_items.find_or_initialize_by(item_id: params[:item_id])
    @line_item.quantity = @line_item.quantity + 1
    respond_to do |format|
      if @line_item.save
        format.html { redirect_to @line_item.cart, notice: 'Line item was successfully created.' }
        format.json { render action: 'show', status: :created, location: @line_item }
      else
        format.html { render action: 'new' }
        format.json do
          render json: @line_item.errors,
                 status: :unprocessable_entity
        end
      end
    end
  end

  def edit
  end

  def update
    @line_item.update_attributes(line_item_params)
    respond_to do |format|
      if @line_item.save
        format.html { redirect_to @line_item.cart, notice: 'Line item was successfully Added.' }
        format.json { render action: 'show', status: :created, location: @line_item }
      else
        format.html { render action: 'new' }
        format.json do
          render json: @line_item.errors,
                 status: :unprocessable_entity
        end
      end
    end
  end

  def destroy
    @line_item.destroy
    redirect_to root_path, alert: 'Item has been successfully removed'
  end

  private

  def line_item_params
    params.require(:line_item).permit(:quantity)
  end

  def set_line_item
    @line_item = LineItem.find(params[:id])
  end
end
