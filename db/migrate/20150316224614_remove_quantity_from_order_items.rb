class RemoveQuantityFromOrderItems < ActiveRecord::Migration
  def change
    remove_column :order_items, :quantity, :integer
  end
end
