class VisitorOption < State
  default_scope {where type_id: 2}
  has_many :visitors
end
