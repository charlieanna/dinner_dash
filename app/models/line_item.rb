class LineItem < ActiveRecord::Base
  belongs_to :item
  belongs_to :cart
  delegate :title, to: :item

  def total_price
  	item.price * quantity
  end
end
