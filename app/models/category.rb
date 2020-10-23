class Category < ActiveRecord::Base

  # Relationships will be detected as long as you follow the conventions(Posts in plural)
  has_many :posts #, class_name: "Post", foreign_key: "category_id"

  # Polymorphic relationship
  has_many :metas, as: :metatable


end
