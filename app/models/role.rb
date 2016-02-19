class Role < State
  default_scope {where type_id: 1}
  has_many :users
end
