class CreatePostsTable < ActiveRecord::Migration
  def change
    # changed from 'posts_tables' to 'posts'
    create_table :posts do |t|
      t.string :title
      t.text :content
    end
  end
end
