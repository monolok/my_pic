class AddInCartToImages < ActiveRecord::Migration
  def change
    add_column :images, :in_cart, :boolean
  end
end
