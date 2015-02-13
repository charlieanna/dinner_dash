class AddStateToItems < ActiveRecord::Migration
  def change
    add_column :items, :state, :string, default: 'open'
  end
end
