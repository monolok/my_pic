class AddInCartToOrderItems < ActiveRecord::Migration
  def change
    add_column :order_items, :in_cart, :boolean
  end
end
