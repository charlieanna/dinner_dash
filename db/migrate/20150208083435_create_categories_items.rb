class CreateCategoriesItems < ActiveRecord::Migration
  def change
    create_table :categories_items do |t|
      t.belongs_to :category, index: true
      t.belongs_to :item, index: true

      t.timestamps
    end
  end
end
