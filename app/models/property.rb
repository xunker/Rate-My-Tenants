class Property < ActiveRecord::Base
	belongs_to :user

  has_many :ratings
  accepts_nested_attributes_for :ratings

  validates_presence_of :zip
  validates_presence_of :name

  before_save :get_city_and_state_from_zip

  def get_city_and_state_from_zip
    geo = GeoKit::Geocoders::MultiGeocoder.multi_geocoder(self.zip)
    if geo.success
      self.city = geo.city
      self.state = geo.state
    end
  end
end
