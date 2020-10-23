class AddOnlineToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :online, :boolean, default: 0
  end
end
