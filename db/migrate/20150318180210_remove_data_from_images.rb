class RemoveDataFromImages < ActiveRecord::Migration
  def change
    remove_column :images, :data, :binary
  end
end
