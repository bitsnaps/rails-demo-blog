class AddCategoryToPosts < ActiveRecord::Migration
  def change
    # will add category_id field
    add_reference :posts, :category, index: true, foreign_key: true
  end
end
