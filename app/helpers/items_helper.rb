module ItemsHelper
  def bought_by item, user
    return false unless user
    items = user.orders.where(status: 'completed').
      flat_map(&:items)
    return items.include? item
  end
end
