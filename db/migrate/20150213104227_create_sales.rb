class CreateSales < ActiveRecord::Migration
  def change
    create_table :sales do |t|
      t.string :name
      t.decimal :discount

      t.timestamps
    end
  end
end
