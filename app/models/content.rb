class Content < ActiveRecord::Base
  belongs_to :state
  belongs_to :type
  belongs_to :user
end