class Crime < ActiveRecord::Base
  acts_as_mappable :default_units => :kms,
                   :lat_column_name => :latitude,
                   :lng_column_name => :longitutde
  validates :objid, uniqueness: true

  def geolocate
    Geokit::LatLng.new(self.latitude, self.longitude)
  end


end
