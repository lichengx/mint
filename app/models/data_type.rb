class DataType < State
  default_scope {where type_id: 3}
  belongs_to :user
end
