class RemoveInCartFromImages < ActiveRecord::Migration
  def change
    remove_column :images, :in_cart, :boolean
  end
end
