class RenamePostTitleToName < ActiveRecord::Migration
  def change
    change_table :posts do |t|
      t.rename :title, :name
      t.timestamps # add created_at & updated_at
    end
  end
end
