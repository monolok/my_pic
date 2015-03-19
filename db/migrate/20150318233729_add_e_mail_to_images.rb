class AddEMailToImages < ActiveRecord::Migration
  def change
    add_column :images, :e_mail, :string
  end
end
