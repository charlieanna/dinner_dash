class AddItemIdToReviews < ActiveRecord::Migration
  def change
    add_column :reviews, :item_id, :integer
  end
end
