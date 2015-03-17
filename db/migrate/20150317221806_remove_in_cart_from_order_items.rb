class RemoveInCartFromOrderItems < ActiveRecord::Migration
  def change
    remove_column :order_items, :in_cart, :boolean
  end
end
