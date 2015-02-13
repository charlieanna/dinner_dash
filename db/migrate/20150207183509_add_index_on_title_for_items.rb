class AddIndexOnTitleForItems < ActiveRecord::Migration
  def change
    add_index :items, :title
  end
end
