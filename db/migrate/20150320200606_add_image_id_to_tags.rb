class AddImageIdToTags < ActiveRecord::Migration
  def change
    add_column :tags, :image_id, :integer
  end
end
