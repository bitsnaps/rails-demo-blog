class Tag < ActiveRecord::Base

  # Tag to Post relationship (many-to-many)
  has_and_belongs_to_many :posts

end
