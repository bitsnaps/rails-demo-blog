class Meta < ActiveRecord::Base

  # if you don't want to follow the naming convention (plural), you have to specify table_name
  # self.table_name = 'metas'

  belongs_to :metatable, polymorphic: true
end
