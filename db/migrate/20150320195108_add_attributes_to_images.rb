class AddAttributesToImages < ActiveRecord::Migration
  def change
    add_column :images, :city, :string
    add_column :images, :description1, :text
    add_column :images, :description2, :text
    add_column :images, :tag_id, :integer
  end
end
