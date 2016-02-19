class Visitor < ActiveRecord::Base
  validates_presence_of :state_id
  belongs_to :state, -> { where type_id: 2 }
  geocoded_by  :address
  reverse_geocoded_by :latitude, :longitude
  after_validation :geocode, :reverse_geocode
  def address
    [latitude,longitude].compact.join(',')
  end
end
