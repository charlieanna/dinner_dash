module ItemsHelper
  def bought_by item, user
    orders = user.orders
    line_items = orders.map { |order| order.line_item }
    items = line_items.map { |line_item| line_item.item }
    if items.include? self
      return true
    end
    return false
  end
end