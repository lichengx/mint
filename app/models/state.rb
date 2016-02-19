class State < ActiveRecord::Base
  translates :title, :description
  accepts_nested_attributes_for :translations, allow_destroy: true
  translation_class.validates :title, presence: true

  belongs_to :type
end
