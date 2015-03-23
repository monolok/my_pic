class AddAdminOkToImages < ActiveRecord::Migration
  def change
    add_column :images, :admin_ok, :boolean
  end
end
