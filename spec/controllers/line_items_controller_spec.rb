require 'spec_helper'

describe LineItemsController do
  test "should create line_item" do
  	assert_difference('LineItem.count') do
    post :create, product_id: products(:ruby).id
  end
  assert_redirected_to cart_path(assigns(:line_item).cart)
end

end