class AddSaleIdToCategories < ActiveRecord::Migration
  def change
    add_reference :categories, :sale, index: true
  end
end
