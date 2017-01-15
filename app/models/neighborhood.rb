class Neighborhood < ActiveRecord::Base
  acts_as_mappable :default_units => :kms

  serialize :coordinates

  def crimes
    crimes = []
    Crime.all.each do |crime|
      crime_location = crime.geolocate
      crimes << crime if self.coordinates.contains?(crime_location)
    end
    crimes
  end
end
