class DropOrdersTables < ActiveRecord::Migration
  def change
  	drop_table :order_items
  	drop_table :order_statuses
  	drop_table :orders
  end
end
