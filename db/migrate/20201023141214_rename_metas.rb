class RenameMetas < ActiveRecord::Migration
  def change
    rename_table :metas, :meta
  end
end
