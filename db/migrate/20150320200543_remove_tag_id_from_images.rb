class RemoveTagIdFromImages < ActiveRecord::Migration
  def change
    remove_column :images, :tag_id, :integer
  end
end
