class AddSaleIdToItems < ActiveRecord::Migration
  def change
    add_reference :items, :sale, index: true
  end
end
