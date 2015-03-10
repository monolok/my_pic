class AddPriceToImages < ActiveRecord::Migration
  def change
    add_column :images, :price, :decimal, :precision => 12, :scale => 3
  end
end
