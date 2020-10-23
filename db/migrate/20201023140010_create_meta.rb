class CreateMeta < ActiveRecord::Migration
  def change
    create_table :metas do |t|
      t.string :name
      t.references :metatable, polymorphic: true, index: true
    end

  end
end
